//
//  ButtonDetailViewController.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/24.
//

import UIKit

class ButtonDetailViewController: UIViewController {

    private var detailView = ButtonDetailView()
    
    var uikitData: UIKits?
    
    override func loadView() {
        
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
        setupDetailView()
    }
    
    func setupDetailView() {
        detailView.codeTableView.dataSource = self
        detailView.codeTableView.delegate = self
        detailView.codeTableView.rowHeight = 80
        
        detailView.codeTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "CodeCell")
    }
    
    func setupNavigation() {
        self.navigationItem.title = uikitData?.UIKitName
    }
    
    func setupData() {
        
    }
}

extension ButtonDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CodeCell", for: indexPath) as! DetailTableViewCell
        
        cell.label.text = "none code "
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        return cell
    }
    
    
}

extension ButtonDetailViewController: UITableViewDelegate {
    
}
