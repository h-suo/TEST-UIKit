//
//  SecondViewController.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/20.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        setupNavigation()
    }
    
    func setupNavigation() {
        self.navigationItem.title = "Setting"
        self.navigationItem.largeTitleDisplayMode = .never
    }
}
