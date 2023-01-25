//
//  LabelDetailViewController.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/24.
//

import UIKit

class LabelDetailViewController: UIViewController, UITextFieldDelegate {

    private var detailView = LabelDetailView()
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension LabelDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uikitData?.UIKitFunction.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CodeCell", for: indexPath) as! DetailTableViewCell
        
        cell.label.text = uikitData?.UIKitFunction[indexPath.row]
        cell.textField.placeholder = uikitData?.UIKitFunctionType[indexPath.row]
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.textField.tag = indexPath.row
        cell.textField.delegate = self
        
        return cell
    }
    
    
}

extension LabelDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
