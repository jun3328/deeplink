//
//  ViewController.swift
//  DeepLink
//
//  Created by lee on 2021/05/28.
//

import UIKit

class MainViewController: UITabBarController {

    enum TabBarItem: Int {
        case home = 0
        case product = 1
        case brand = 2
    }
    
    private let items: [UIViewController] = [HomeViewController(), ProductViewController(), BrandViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        viewControllers = items.map(UINavigationController.init(rootViewController:))        
        
        items[0].tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "Bookmarks"), selectedImage: UIImage(named: "Bookmarks"))
        items[1].tabBarItem = UITabBarItem(title: "Product", image: UIImage(systemName: "Bookmarks"), selectedImage: UIImage(named: "Bookmarks"))
        items[2].tabBarItem = UITabBarItem(title: "Brand", image: UIImage(systemName: "Home"), selectedImage: UIImage(named: "Bookmarks"))
        
//      let image = UIImage(named: "menubar-bg-mini")!
//      tbc.tabBar.barTintColor = UIColor(patternImage: image)
//      let image = UIImage(named: "menubar-bg-mini")?.stretchableImage(withLeftCapWidth: 5, topCapHeight: 16)
//      tbc.tabBar.backgroundImage = image

//      tabBar.tintColor = .white
//      tabBar.unselectedItemTintColor = .gray
//      tabBar.barTintColor = UIColor.black

//      외형 프록시 객체로 변경
//      let itemProxy = UITabBarItem.appearance()
//      itemProxy.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .disabled)
//      itemProxy.setTitleTextAttributes([.foregroundColor: UIColor.red], for: .selected)
//      itemProxy.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 15)], for: .normal)
    }
}

extension MainViewController: UITabBarControllerDelegate {
    
    
}

#if DEBUG
import SwiftUI

struct MainViewController_Previews: PreviewProvider {
    static var previews: some View {
         Group {
            ViewControllerRepresentable(target: MainViewController())
                .previewDevice(.iPhone12)

            ViewControllerRepresentable(target: MainViewController())
                .previewDevice(.iPhone8)
        }
    }
}
#endif
