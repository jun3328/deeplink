//
//  HomeDetailViewController.swift
//  DeepLink
//
//  Created by lee on 2021/05/28.
//

import UIKit

class HomeDetailViewController: BaseViewController {
    private let homeID: Int
    
    init(homeID: Int) {
        self.homeID =  homeID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "홈 싱세 \(homeID)"
        view.backgroundColor = .brown
        // Do any additional setup after loading the view.
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
