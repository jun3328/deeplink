//
//  BrandDetailViewController.swift
//  DeepLink
//
//  Created by lee on 2021/05/28.
//

import UIKit

class BrandDetailViewController: BaseViewController {
    private let brandID: Int
    
    init(brandID: Int) {
        self.brandID =  brandID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "브랜드상세 \(brandID)"
        view.backgroundColor = .systemPurple
        // Do any additional setup after loading the view.
    }
    
}
