//
//  ProductViewController.swift
//  DeepLink
//
//  Created by lee on 2021/05/28.
//

import UIKit

class ProductViewController: BaseViewController {
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
        self.title = "상품"
        self.view.backgroundColor = .systemGreen
        // Do any additional setup after loading the view.
        
        
        view.addSubview(button)
        
        
        button.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func tap(_ v: UIView) {
        let vc = ProductDetailViewController(productID: 3)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
