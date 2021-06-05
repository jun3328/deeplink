//
//  BrandViewController.swift
//  DeepLink
//
//  Created by lee on 2021/05/28.
//

import UIKit

class BrandViewController: BaseViewController {
    private let button: UIButton = {
        let view = UIButton()
        view.setTitle("btn", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "브랜드"
        self.view.backgroundColor = .blue
        view.addSubview(button)
        
        
        button.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    

    @objc func tap(_ v: UIView) {
        let vc = BrandDetailViewController(brandID: 1)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
