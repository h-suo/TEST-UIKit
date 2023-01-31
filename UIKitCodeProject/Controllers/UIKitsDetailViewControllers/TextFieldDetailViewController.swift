//
//  TextFieldDetailViewController.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/31.
//

import UIKit

class TextFieldDetailViewController: UIViewController {

    private var detailView = TextFieldDetailView()
    
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
            self.detailView.textField.text = textData
        case 1:
            self.detailView.textField.placeholder = textData
        default:
            break
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension TextFieldDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let functionCount: Int = (uikitCodeData?.UIKitFunction.count)! + (uikitButtonData?.UIKitFunction.count)!

        return functionCount
    }
    
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

            switch uikitButtonData?.UIKitFunction[indexPath.row - (uikitCodeData?.UIKitFunction.count)!] {
            case "textField.textColor":
                let red = UIAction(title: "red", image: UIImage(systemName: ""), handler: { _ in self.detailView.textField.textColor = .red })
                let green = UIAction(title: "green", image: UIImage(systemName: ""), handler: { _ in self.detailView.textField.textColor = .green })
                let blue = UIAction(title: "blue", image: UIImage(systemName: ""), handler: { _ in self.detailView.textField.textColor = .blue })
                let gray = UIAction(title: "gray", image: UIImage(systemName: ""), handler: { _ in self.detailView.textField.textColor = .gray })
                let white = UIAction(title: "white", image: UIImage(systemName: ""), handler: { _ in self.detailView.textField.textColor = .white })
                let black = UIAction(title: "black", image: UIImage(systemName: ""), handler: { _ in self.detailView.textField.textColor = .black })
                bCell.button.menu = UIMenu(title: "UIColor",
                                             image: UIImage(systemName: ""),
                                             identifier: nil,
                                             options: .displayInline,
                                           children: [red, green, blue, gray, white, black])
            case "textField.BorderStyle":
                let none = UIAction(title: "none", image: UIImage(systemName: ""), handler: { _ in self.detailView.textField.borderStyle = .none })
                let roundedRect = UIAction(title: "roundedRect", image: UIImage(systemName: ""), handler: { _ in self.detailView.textField.borderStyle = .roundedRect })
                let bezel = UIAction(title: "bezel", image: UIImage(systemName: ""), handler: { _ in self.detailView.textField.borderStyle = .bezel })
                let line = UIAction(title: "line", image: UIImage(systemName: ""), handler: { _ in self.detailView.textField.borderStyle = .line })
                bCell.button.menu = UIMenu(title: "Style",
                                             image: UIImage(systemName: ""),
                                             identifier: nil,
                                             options: .displayInline,
                                           children: [none, roundedRect, bezel, line])
            default:
                break
            }

            return bCell
        }



        let cell = tableView.dequeueReusableCell(withIdentifier: "CodeCell") as! DetailTableViewCell

        return cell
    }
}

extension TextFieldDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension TextFieldDetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        codeTag = textField.tag
        textData = textField.text!
        
        setupCode()
        
        return true
    }
}
