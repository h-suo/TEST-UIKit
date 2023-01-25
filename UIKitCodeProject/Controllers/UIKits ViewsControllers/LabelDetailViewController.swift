//
//  LabelDetailViewController.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/24.
//

import UIKit

class LabelDetailViewController: UIViewController {

    private let detailView = LabelDetailView()
    
    var uikitData: UIKits?
    
    override func loadView() {
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setupNavigation() {
        self.navigationItem.title = uikitData?.UIKitName
    }
    
    func setupData() {
        
    }
    
}
