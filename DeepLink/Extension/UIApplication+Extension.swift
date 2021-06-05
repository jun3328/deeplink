//
//  UIApplication+Extension.swift
//  DeepLink
//
//  Created by lee on 2021/06/05.
//

import UIKit

extension UIApplication {

    func topViewController() -> UIViewController? {
        UIApplication.shared.windows
            .filter { $0.isKeyWindow }
            .first?.rootViewController?
            .topViewController()
    }
}
