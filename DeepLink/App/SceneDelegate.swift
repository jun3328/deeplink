//
//  SceneDelegate.swift
//  DeepLink
//
//  Created by lee on 2021/05/28.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = MainViewController()
            window?.makeKeyAndVisible()

            self.scene(scene, openURLContexts: connectionOptions.urlContexts)
        }
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard
            let _ = window,
            let url = URLContexts.first?.url,
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            return
        }
        
        switch components.scheme {
        case "joon":
            handleDeepLink(components: components)
        default:
            break
        }
        print("open url \(url)")
        showComponents(components)
    }
    
    private func handleDeepLink(components : URLComponents) {
        guard
            let mainViewController = window?.rootViewController as? MainViewController,
            let navigationController = mainViewController.selectedViewController as? UINavigationController,
            let navRootViewController = navigationController.viewControllers.first
        else {
            return
        }

        var nav = navigationController
        nav.presentedViewController?.dismiss(animated: true)
        nav.popToRootViewController(animated: true)
        mainViewController.tabBar.isHidden = false
        let path = Int(components.path.trimmingCharacters(in: ["/"]))
        
        switch components.host {
        case "home":
            if !(navRootViewController is HomeViewController) {
                mainViewController.selectedIndex = 0
                nav = mainViewController.selectedViewController as! UINavigationController
            }
            guard let path = path else { return }
            proceed(nav, target: HomeDetailViewController(homeID: path))
        case "product":
            if !(navRootViewController is ProductViewController) {
                mainViewController.selectedIndex = 1
                nav = mainViewController.selectedViewController as! UINavigationController
            }
            guard let path = path else { return }
            proceed(nav, target: ProductDetailViewController(productID: path))
        case "brand":
            if !(navRootViewController is BrandViewController) {
                mainViewController.selectedIndex = 2
                nav = mainViewController.selectedViewController as! UINavigationController
            }
            guard let path = path else { return }
            proceed(nav, target: BrandDetailViewController(brandID: path))
        default:
            break
        }
    }
    
    private func proceed(_ nav: UINavigationController, target: UIViewController) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            target.hidesBottomBarWhenPushed = true
            nav.pushViewController(target, animated: true)
        }
    }
    
    private func showComponents(_ components : URLComponents) {
        let scheme = components.scheme ?? ""
        let host = components.host ?? ""
        let query = components.percentEncodedQuery ?? ""
        let fragment = components.fragment ?? ""
        let path = components.path
        print("scheme:  \(scheme)")
        print("host:  \(host)")
        print("query:  \(query)")
        print("fragment:  \(fragment)")
        print("path:  \(path)")
    }
}
