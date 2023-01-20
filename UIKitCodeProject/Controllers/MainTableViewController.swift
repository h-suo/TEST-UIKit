//
//  MainTableViewController.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/20.
//

import UIKit

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        setupNavigation()
        navigationItemSetting()
        setupTableView()
        tableView.reloadData()
    }
    
    func setupNavigation() {
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Test UIKit"
        self.navigationController?.overrideUserInterfaceStyle = .dark
    }
    
    func navigationItemSetting() {
        let rightButtn = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(pressButton(_:)))
        self.navigationItem.rightBarButtonItem = rightButtn
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 120
        tableView.register(UIKitTableViewCell.self, forCellReuseIdentifier: "UIKitCell")
    }
    
    @IBAction func pressButton(_ sender: UIBarButtonItem) {
        let secondView = SecondViewController()
        self.navigationController?.pushViewController(secondView, animated: true)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UIKitCell", for: indexPath) as! UIKitTableViewCell
        
        cell.mainImageView.image = UIImage(named: "ButtonMain")
        cell.tittleLabel.text = "Button"
        cell.selectionStyle = .none
        
        return cell
    }
    
}
