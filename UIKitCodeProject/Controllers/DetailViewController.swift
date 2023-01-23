//
//  DetailViewController.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/23.
//

import UIKit

class DetailViewController: UIViewController {

    private let detailView = DetailView()
    
    override func loadView() {
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Button"
//        self.navigationItem.largeTitleDisplayMode = .never
    }
    
}
