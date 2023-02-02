//
//  SwitchDetailViewController.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/02/02.
//

import UIKit

class SwitchDetailViewController: UIViewController {

    private var detailView = SwitchDetailView()
    
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
            if let boolCheck = Bool(textData) {
                detailView.switchControl.isOn = boolCheck
            }
        case 1:
            if let boolCheck = Bool(textData) {
                detailView.switchControl.setOn(boolCheck, animated: true)
            }        default:
            break
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension SwitchDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let functionCount: Int = (uikitCodeData?.UIKitFunction.count)! + (uikitButtonData?.UIKitFunction.count)!

        return functionCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row <= (uikitCodeData?.UIKitFunction.count)! - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CodeCell", for: indexPath) as! DetailTableViewCell

            cell.label.text = uikitCodeData?.UIKitFunction[indexPath.row]
            cell.textField.placeholder = uikitCodeData?.UIKitFunctionType[indexPath.row]
            cell.textField.tag = indexPath.row
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.textField.delegate = self
            
            if uikitCodeData?.UIKitFunction[indexPath.row] == "switch.setOn" {
                cell.equalLabel.text = ""
            }

            return cell
        } else if indexPath.row >= (uikitCodeData?.UIKitFunction.count)! {
            let bCell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! DetailButtonTableViewCell
            bCell.label.text = uikitButtonData?.UIKitFunction[indexPath.row - (uikitCodeData?.UIKitFunction.count)!]
            bCell.button.setTitle(uikitButtonData?.UIKitFunctionType[indexPath.row - (uikitCodeData?.UIKitFunction.count)!], for: .normal)
            bCell.selectionStyle = .none
            bCell.backgroundColor = .clear

            switch uikitButtonData?.UIKitFunction[indexPath.row - (uikitCodeData?.UIKitFunction.count)!] {
            case "switch.thumbTintColor":
                let red = UIAction(title: "red", image: UIImage(systemName: ""), handler: { _ in self.detailView.switchControl.thumbTintColor = .red })
                let green = UIAction(title: "green", image: UIImage(systemName: ""), handler: { _ in self.detailView.switchControl.thumbTintColor = .green })
                let blue = UIAction(title: "blue", image: UIImage(systemName: ""), handler: { _ in self.detailView.switchControl.thumbTintColor = .blue })
                let gray = UIAction(title: "gray", image: UIImage(systemName: ""), handler: { _ in self.detailView.switchControl.thumbTintColor = .gray })
                let white = UIAction(title: "white", image: UIImage(systemName: ""), handler: { _ in self.detailView.switchControl.thumbTintColor = .white })
                let black = UIAction(title: "black", image: UIImage(systemName: ""), handler: { _ in self.detailView.switchControl.thumbTintColor = .black })
                bCell.button.menu = UIMenu(title: "UIColor",
                                             image: UIImage(systemName: ""),
                                             identifier: nil,
                                             options: .displayInline,
                                           children: [red, green, blue, gray, white, black])
            case "switch.onTintColor":
                let red = UIAction(title: "red", image: UIImage(systemName: ""), handler: { _ in self.detailView.switchControl.onTintColor = .red })
                let green = UIAction(title: "green", image: UIImage(systemName: ""), handler: { _ in self.detailView.switchControl.onTintColor = .green })
                let blue = UIAction(title: "blue", image: UIImage(systemName: ""), handler: { _ in self.detailView.switchControl.onTintColor = .blue })
                let gray = UIAction(title: "gray", image: UIImage(systemName: ""), handler: { _ in self.detailView.switchControl.onTintColor = .gray })
                let white = UIAction(title: "white", image: UIImage(systemName: ""), handler: { _ in self.detailView.switchControl.onTintColor = .white })
                let black = UIAction(title: "black", image: UIImage(systemName: ""), handler: { _ in self.detailView.switchControl.onTintColor = .black })
                bCell.button.menu = UIMenu(title: "UIColor",
                                             image: UIImage(systemName: ""),
                                             identifier: nil,
                                             options: .displayInline,
                                           children: [red, green, blue, gray, white, black])
            default:
                break
            }

            return bCell
        }



        let cell = tableView.dequeueReusableCell(withIdentifier: "CodeCell") as! DetailTableViewCell

        return cell
    }
}

extension SwitchDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension SwitchDetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        codeTag = textField.tag
        textData = textField.text!
        
        setupCode()
        
        return true
    }
}
