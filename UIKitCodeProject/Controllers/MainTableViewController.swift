//
//  MainTableViewController.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/20.
//

import UIKit

class MainTableViewController: UITableViewController {

    var uikitArray: [UIKits] = []
    
    var uikitDataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        setupNavigation()
        navigationItemSetting()
        setupData()
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
    
    func setupData() {
        uikitDataManager.makeUIKitData()
        uikitArray = uikitDataManager.getUIKitData()
    }
    
    @IBAction func pressButton(_ sender: UIBarButtonItem) {
        let settingView = SettingViewController()
        self.navigationController?.pushViewController(settingView, animated: true)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return uikitArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UIKitCell", for: indexPath) as! UIKitTableViewCell
        
        cell.mainImageView.image = uikitArray[indexPath.row].UIKitImage
        cell.tittleLabel.text = uikitArray[indexPath.row].UIKitName
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if uikitArray[indexPath.row].UIKitName == "Label" {
            
        }
        
        switch uikitArray[indexPath.row].UIKitName {
        case "Label":
            let detailVC = LabelDetailViewController()
            detailVC.uikitData = uikitArray[indexPath.row]
            
            navigationController?.pushViewController(detailVC, animated: true)
        case "Button":
            let detailVC = ButtonDetailViewController()
            detailVC.uikitData = uikitArray[indexPath.row]
            
            navigationController?.pushViewController(detailVC, animated: true)
        default:
            break
        }
    }
    
}
