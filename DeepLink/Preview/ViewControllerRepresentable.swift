//
//  ViewControllerRepresentable.swift
//  DeepLink
//
//  Created by lee on 2021/05/28.
//

import SwiftUI

struct ViewControllerRepresentable<V: UIViewController>: UIViewControllerRepresentable {
    
    let target: V
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { /* no-op */ }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return target
    }
}
