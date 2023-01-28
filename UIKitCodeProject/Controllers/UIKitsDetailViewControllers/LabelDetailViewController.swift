//
//  LabelDetailViewController.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/24.
//

import UIKit

class LabelDetailViewController: UIViewController {
    
    private var detailView = LabelDetailView()
    
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
            detailView.label.text = textData
        case 1:
            guard let num = Int(textData) else { return }
            detailView.label.numberOfLines = num
        default:
            break
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension LabelDetailViewController: UITableViewDataSource {
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
            
            return cell
        } else if indexPath.row >= (uikitCodeData?.UIKitFunction.count)! {
            let bCell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! DetailButtonTableViewCell
            bCell.label.text = uikitButtonData?.UIKitFunction[indexPath.row - (uikitCodeData?.UIKitFunction.count)!]
            bCell.button.setTitle(uikitButtonData?.UIKitFunctionType[indexPath.row - (uikitCodeData?.UIKitFunction.count)!], for: .normal)
            bCell.selectionStyle = .none
            bCell.backgroundColor = .clear
            
            switch uikitButtonData?.UIKitFunctionType[indexPath.row - (uikitCodeData?.UIKitFunction.count)!] {
            case "UIFont!":
                let systemFont = UIAction(title: "systemFont", image: UIImage(systemName: ""), handler: { _ in self.detailView.label.font = .systemFont(ofSize: 18) })
                let boldSystemFont = UIAction(title: "boldSystemFont", image: UIImage(systemName: ""), handler: { _ in self.detailView.label.font = .boldSystemFont(ofSize: 18) })
                bCell.button.menu = UIMenu(title: "UIFont",
                                             image: UIImage(systemName: ""),
                                             identifier: nil,
                                             options: .displayInline,
                                           children: [systemFont, boldSystemFont])
            case "UIColor!":
                let red = UIAction(title: "red", image: UIImage(systemName: ""), handler: { _ in self.detailView.label.textColor = .red })
                let green = UIAction(title: "green", image: UIImage(systemName: ""), handler: { _ in self.detailView.label.textColor = .green })
                let blue = UIAction(title: "blue", image: UIImage(systemName: ""), handler: { _ in self.detailView.label.textColor = .blue })
                let gray = UIAction(title: "gray", image: UIImage(systemName: ""), handler: { _ in self.detailView.label.textColor = .gray })
                let white = UIAction(title: "white", image: UIImage(systemName: ""), handler: { _ in self.detailView.label.textColor = .white })
                let black = UIAction(title: "black", image: UIImage(systemName: ""), handler: { _ in self.detailView.label.textColor = .black})
                bCell.button.menu = UIMenu(title: "UIColor",
                                             image: UIImage(systemName: ""),
                                             identifier: nil,
                                             options: .displayInline,
                                           children: [red, green, blue, gray, white, black])
            case "NSTextAlignment":
                let center = UIAction(title: "center", image: UIImage(systemName: ""), handler: { _ in self.detailView.label.textAlignment = .center })
                let justified = UIAction(title: "justified", image: UIImage(systemName: ""), handler: { _ in self.detailView.label.textAlignment = .justified })
                let left = UIAction(title: "left", image: UIImage(systemName: ""), handler: { _ in self.detailView.label.textAlignment = .left })
                let natural = UIAction(title: "natural", image: UIImage(systemName: ""), handler: { _ in self.detailView.label.textAlignment = .natural })
                let right = UIAction(title: "right", image: UIImage(systemName: ""), handler: { _ in self.detailView.label.textAlignment = .right })
                bCell.button.menu = UIMenu(title: "NSTextAlignment",
                                             image: UIImage(systemName: ""),
                                             identifier: nil,
                                             options: .displayInline,
                                           children: [center, justified, left, natural, right])
            default:
                break
            }
            
            return bCell
        }
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CodeCell") as! DetailTableViewCell
        
        return cell
    }
}

extension LabelDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension LabelDetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        codeTag = textField.tag
        textData = textField.text!
        
        setupCode()
        
        return true
    }
}
