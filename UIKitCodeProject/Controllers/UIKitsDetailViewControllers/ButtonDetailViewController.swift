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
    var uikitCodeData: UIKitsCodeFunction?
    var uikitButtonData: UIKitsButtonFunction?
    
    var textData: String = ""
    var codeTag: Int = 0
    
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
        detailView.codeTableView.register(DetailButtonTableViewCell.self, forCellReuseIdentifier: "ButtonCell")
    }
    
    func setupNavigation() {
        self.navigationItem.title = uikitData?.UIKitName
    }
    
    func setupCode() {
        switch codeTag {
        case 0:
            detailView.button.setTitle(textData, for: .normal)
        default:
            break
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ButtonDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let functionCount: Int = (uikitCodeData?.UIKitFunction.count)! + (uikitButtonData?.UIKitFunction.count)!
        
        return functionCount    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row <= (uikitCodeData?.UIKitFunction.count)! - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CodeCell", for: indexPath) as! DetailTableViewCell
            
            cell.label.text = uikitCodeData?.UIKitFunction[indexPath.row]
            cell.textField.placeholder = uikitCodeData?.UIKitFunctionType[indexPath.row]
            cell.equalLabel.text = ""
            cell.textField.tag = indexPath.row
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.textField.delegate = self
            
            return cell
        } else if indexPath.row >= (uikitCodeData?.UIKitFunction.count)! {
            let bCell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! DetailButtonTableViewCell
            bCell.label.text = uikitButtonData?.UIKitFunction[indexPath.row - (uikitCodeData?.UIKitFunction.count)!]
            bCell.button.setTitle(uikitButtonData?.UIKitFunctionType[indexPath.row - (uikitCodeData?.UIKitFunction.count)!], for: .normal)
            bCell.equalLabel.text = ""
            bCell.selectionStyle = .none
            bCell.backgroundColor = .clear
            
            switch uikitButtonData?.UIKitFunctionType[indexPath.row - (uikitCodeData?.UIKitFunction.count)!] {
            case "UIColor?":
                let red = UIAction(title: "red", image: UIImage(systemName: ""), handler: { _ in self.detailView.button.setTitleColor(.red, for: .normal) })
                let green = UIAction(title: "green", image: UIImage(systemName: ""), handler: { _ in self.detailView.button.setTitleColor(.green, for: .normal) })
                let blue = UIAction(title: "blue", image: UIImage(systemName: ""), handler: { _ in self.detailView.button.setTitleColor(.blue, for: .normal) })
                let gray = UIAction(title: "gray", image: UIImage(systemName: ""), handler: { _ in self.detailView.button.setTitleColor(.gray, for: .normal) })
                let white = UIAction(title: "white", image: UIImage(systemName: ""), handler: { _ in self.detailView.button.setTitleColor(.white, for: .normal) })
                let black = UIAction(title: "black", image: UIImage(systemName: ""), handler: { _ in self.detailView.button.setTitleColor(.black, for: .normal) })
                bCell.button.menu = UIMenu(title: "UIColor",
                                             image: UIImage(systemName: ""),
                                             identifier: nil,
                                             options: .displayInline,
                                           children: [red, green, blue, gray, white, black])
            case "UIImage?":
                let Image = UIAction(title: "Image", image: UIImage(systemName: ""), handler: { _ in self.detailView.button.setImage(UIImage(named: "Image")?.withRenderingMode(.alwaysOriginal), for: .normal) })
                let none = UIAction(title: "none", image: UIImage(systemName: ""), handler: { _ in self.detailView.button.setImage(UIImage(named: ""), for: .normal) })
                bCell.button.menu = UIMenu(title: "UIImage",
                                             image: UIImage(systemName: ""),
                                             identifier: nil,
                                             options: .displayInline,
                                           children: [Image, none])
            default:
                break
            }
            
            return bCell
        }
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CodeCell") as! DetailTableViewCell
        
        return cell
    }
    
    
}

extension ButtonDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ButtonDetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        codeTag = textField.tag
        textData = textField.text!
        
        setupCode()
        
        return true
    }
}
