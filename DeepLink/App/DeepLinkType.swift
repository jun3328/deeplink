//
//  DeepLinkType.swift
//  DeepLink
//
//  Created by lee on 2021/06/05.
//

import Foundation

enum DeepLinkType: String, CaseIterable {

    static let scheme = "joon"

    case home = "home"
    case product = "product"
    case brand = "brand"

    static func getDeepLinkType(_ components: URLComponents) -> DeepLinkType {
        return DeepLinkType.allCases.first { $0.rawValue == components.host } ?? .home
    }
}
