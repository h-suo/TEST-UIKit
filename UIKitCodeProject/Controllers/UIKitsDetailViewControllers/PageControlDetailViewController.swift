//
//  PageControlDetailViewController.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/02/03.
//

import UIKit

class PageControlDetailViewController: UIViewController {

    private var detailView = PageControlDetailView()
    
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
            if let value = Int(textData) {
                detailView.pageControl.currentPage = value
            }
        case 1:
            if let value = Int(textData) {
                detailView.pageControl.numberOfPages = value
            }
        case 2:
            if let boolCheck = Bool(textData) {
                detailView.pageControl.hidesForSinglePage = boolCheck
            }
        default:
            break
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension PageControlDetailViewController: UITableViewDataSource {
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

            switch uikitButtonData?.UIKitFunction[indexPath.row - (uikitCodeData?.UIKitFunction.count)!] {
            case "pageControl.pageIndicatorTintColor":
                let red = UIAction(title: "red", image: UIImage(systemName: ""), handler: { _ in self.detailView.pageControl.pageIndicatorTintColor = .red })
                let green = UIAction(title: "green", image: UIImage(systemName: ""), handler: { _ in self.detailView.pageControl.pageIndicatorTintColor = .green })
                let blue = UIAction(title: "blue", image: UIImage(systemName: ""), handler: { _ in self.detailView.pageControl.pageIndicatorTintColor = .blue })
                let gray = UIAction(title: "gray", image: UIImage(systemName: ""), handler: { _ in self.detailView.pageControl.pageIndicatorTintColor = .gray })
                let white = UIAction(title: "white", image: UIImage(systemName: ""), handler: { _ in self.detailView.pageControl.pageIndicatorTintColor = .white })
                let black = UIAction(title: "black", image: UIImage(systemName: ""), handler: { _ in self.detailView.pageControl.pageIndicatorTintColor = .black })
                bCell.button.menu = UIMenu(title: "UIColor",
                                             image: UIImage(systemName: ""),
                                             identifier: nil,
                                             options: .displayInline,
                                           children: [red, green, blue, gray, white, black])
            case "pageControl.currentPageIndicatorTintColor":
                let red = UIAction(title: "red", image: UIImage(systemName: ""), handler: { _ in self.detailView.pageControl.currentPageIndicatorTintColor = .red })
                let green = UIAction(title: "green", image: UIImage(systemName: ""), handler: { _ in self.detailView.pageControl.currentPageIndicatorTintColor = .green })
                let blue = UIAction(title: "blue", image: UIImage(systemName: ""), handler: { _ in self.detailView.pageControl.currentPageIndicatorTintColor = .blue })
                let gray = UIAction(title: "gray", image: UIImage(systemName: ""), handler: { _ in self.detailView.pageControl.currentPageIndicatorTintColor = .gray })
                let white = UIAction(title: "white", image: UIImage(systemName: ""), handler: { _ in self.detailView.pageControl.currentPageIndicatorTintColor = .white })
                let black = UIAction(title: "black", image: UIImage(systemName: ""), handler: { _ in self.detailView.pageControl.currentPageIndicatorTintColor = .black })
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

extension PageControlDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension PageControlDetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        codeTag = textField.tag
        textData = textField.text!
        
        setupCode()
        
        return true
    }
}
