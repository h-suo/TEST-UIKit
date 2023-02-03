//
//  StepperDetailViewController.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/02/03.
//

import UIKit

class StepperDetailViewController: UIViewController {

    private var detailView = StepperDetailView()
    
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
        setupStepperValue()
    }
    
    func setupStepperValue() {
        detailView.label.text = String(detailView.stepper.value)
        detailView.stepper.addTarget(self, action: #selector(stepperChange(sender: )), for: UIControl.Event.valueChanged)
    }
    
    @objc func stepperChange(sender: UIStepper) {
        detailView.label.text = String(round(sender.value * 10) / 10)
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
                detailView.stepper.wraps = boolCheck
            }
        case 1:
            if let value = Double(textData) {
                detailView.stepper.maximumValue = value
            }
        case 2:
            if let value = Double(textData) {
                detailView.stepper.minimumValue = value
            }
        case 3:
            if let value = Double(textData) {
                detailView.stepper.stepValue = value
            }
        default:
            break
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension StepperDetailViewController: UITableViewDataSource {
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
            
            default:
                break
            }

            return bCell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "CodeCell") as! DetailTableViewCell

        return cell
    }
}

extension StepperDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension StepperDetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        codeTag = textField.tag
        textData = textField.text!
        
        setupCode()
        
        return true
    }
}
