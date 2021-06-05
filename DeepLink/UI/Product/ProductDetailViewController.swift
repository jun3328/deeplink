//
//  ProductDetailViewController.swift
//  DeepLink
//
//  Created by lee on 2021/05/28.
//

import UIKit

class ProductDetailViewController: BaseViewController {
    private let productID: Int
    private let button: UIButton = {
        let view = UIButton()
        view.setTitle("btn", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    init(productID: Int) {
        self.productID =  productID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "상품상세 \(productID)"
        self.view.backgroundColor = .systemTeal
        // Do any additional setup after loading the view.
    }
    
    override func configure() {
        view.addSubview(button)
        button.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
    }
    
    override func makeConstraint() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func tap(_ v: UIView) {
        let vc = BrandDetailViewController(brandID: 1)
        present(vc, animated: true, completion: nil)
//        guard let url = URL(string: "joon://brand/394"), UIApplication.shared.canOpenURL(url) else {
//            print("CANNOT open")
//            return
//        }
//
//        UIApplication.shared.open(url, options: [:]) { success in
//            if (success) {
//                print("OPENED \(url): \(success)")
//            } else {
//                print("FAILED to open \(url)")
//            }
//        }
    }
}
