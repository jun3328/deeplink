//
//  UIViewController+Extension.swift
//  DeepLink
//
//  Created by lee on 2021/06/05.
//

import UIKit

extension UIViewController {

    func topViewController() -> UIViewController? {

        if let presented = self.presentedViewController {
            return presented.topViewController()
        }

        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController?.topViewController()
        }

        if let tab = self as? UITabBarController {
            return tab.selectedViewController?.topViewController() ?? tab
        }

        return self
    }
}
