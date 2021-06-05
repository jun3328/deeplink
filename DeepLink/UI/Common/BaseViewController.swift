//
//  BaseViewController.swift
//  DeepLink
//
//  Created by lee on 2021/05/28.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        configure()
        makeConstraint()
        bind()
    }
    
    func configure() { /* no-op */}
    
    func makeConstraint() { /* no-op */}
    
    func bind() { /* no-op */}
}
