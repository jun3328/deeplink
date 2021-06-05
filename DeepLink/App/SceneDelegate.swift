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
        case DeepLinkType.scheme:
            handleDeepLink(components: components)
        default:
            break
        }
        // Log
        print("open url \(url)")
        showComponents(components)
    }
    
    private func handleDeepLink(components : URLComponents) {
        guard
            let mainViewController = window?.rootViewController as? MainViewController,
            let navigationController = mainViewController.selectedViewController as? UINavigationController
        else {
            return
        }

        mainViewController.tabBar.isHidden = false
        var nav = navigationController
        nav.presentedViewController?.dismiss(animated: true)
        nav.popToRootViewController(animated: true)

        let path: Int? = Int(components.path.replacingOccurrences(of: "/", with: ""))

        switch DeepLinkType.getDeepLinkType(components) {
        case .home:
            nav = findNavigationController(mainViewController, item: .home)

            guard let path = path else { return }
            proceed(nav, target: HomeDetailViewController(homeID: path))
        case .product:
            nav = findNavigationController(mainViewController, item: .product)
            
            guard let path = path else { return }
            proceed(nav, target: ProductDetailViewController(productID: path))
        case .brand:
            nav = findNavigationController(mainViewController, item: .brand)
            
            guard let path = path else { return }
            proceed(nav, target: BrandDetailViewController(brandID: path))
        }
    }
    
    private func findNavigationController(
        _ main: MainViewController,
        item: MainViewController.TabBarItem
    ) -> UINavigationController {

        if main.selectedIndex != item.rawValue {
            main.selectedIndex = item.rawValue
        }
        return main.selectedViewController as! UINavigationController
    }
    
    private func proceed(_ nav: UINavigationController, target: UIViewController) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
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
