//
//  DataManager.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/20.
//

import UIKit

class DataManager {
    
    private var uikitList: [UIKits] = []
    private var codeFunctionList: [UIKitsCodeFunction] = []
    private var buttonFunctionList: [UIKitsButtonFunction] = []
    
    func makeUIKitData() {
        uikitList = [
            UIKits(UIKitImage: UIImage(named: "Label"), UIKitName: "Label"),
            UIKits(UIKitImage: UIImage(named: "Button"), UIKitName: "Button"),
            UIKits(UIKitImage: UIImage(named: "Text Field"), UIKitName: "Text Field"),
            UIKits(UIKitImage: UIImage(named: "Switch"), UIKitName: "Switch"),
            UIKits(UIKitImage: UIImage(named: "Slider"), UIKitName: "Slider"),
            UIKits(UIKitImage: UIImage(named: "Activity Indicator View"), UIKitName: "Activity Indicator View"),
            UIKits(UIKitImage: UIImage(named: "Progress View"), UIKitName: "Progress View"),
            UIKits(UIKitImage: UIImage(named: "Stepper"), UIKitName: "Stepper"),
            UIKits(UIKitImage: UIImage(named: "Page Control"), UIKitName: "Page Control"),
            UIKits(UIKitImage: UIImage(named: "Color Well"), UIKitName: "Color Well")
        ]
    }
    
    func makeUIKitCodeFunctionData() {
        codeFunctionList = [
            UIKitsCodeFunction(UIKitName: "Label", UIKitFunction: ["label.text", "label.numberOfLines"], UIKitFunctionType: ["String?", "Int" ]),
            UIKitsCodeFunction(UIKitName: "Button", UIKitFunction: ["button.setTitle"], UIKitFunctionType: ["String?"]),
            UIKitsCodeFunction(UIKitName: "TextField", UIKitFunction: ["textField.text","textField.placeholder"], UIKitFunctionType: ["String?", "String?"]),
            UIKitsCodeFunction(UIKitName: "Switch", UIKitFunction: ["switch.isOn", "switch.setOn"], UIKitFunctionType: ["Bool", "Bool"]),
            UIKitsCodeFunction(UIKitName: "Slider", UIKitFunction: ["slider.maximumValue", "slider.minimumValue"], UIKitFunctionType: ["Float", "Float"]),
            UIKitsCodeFunction(UIKitName: "ActivityIndicatorView", UIKitFunction: ["activityIndicatorView.hidesWhenStopped"], UIKitFunctionType: ["Bool"]),
            UIKitsCodeFunction(UIKitName: "ProgressView", UIKitFunction: ["progressView.progress", "progressView.setProgress"], UIKitFunctionType: ["Float", "Float"]),
        ]
    }
    
    func makeUIKitButtonFunctionData() {
        buttonFunctionList = [
            UIKitsButtonFunction(UIKitName: "Label", UIKitFunction: ["label.font", "label.textColor", "label.textAlignment", "label.backgroundColor"], UIKitFunctionType: ["UIFont!", "UIColor!", "NSTextAlignment", "UIColor?"]),
            UIKitsButtonFunction(UIKitName: "Label", UIKitFunction: [ "button.setTitleColor", "button.setImage", "button.backgroundColor"], UIKitFunctionType: ["UIColor?", "UIImage?", "UIColor?"]),
            UIKitsButtonFunction(UIKitName: "TextField", UIKitFunction: [ "textField.textColor", "textField.BorderStyle", "textField.backgroundColor"], UIKitFunctionType: ["UIColor?", "Style", "UIColor?"]),
            UIKitsButtonFunction(UIKitName: "Switch", UIKitFunction: ["switch.thumbTintColor", "switch.onTintColor"], UIKitFunctionType: ["UIColor?", "UIColor?"]),
            UIKitsButtonFunction(UIKitName: "Slider", UIKitFunction: ["slider.thumbTintColor", "slider.maximumTrackTintColor", "slider.minimumTrackTintColor"], UIKitFunctionType: ["UIColor?", "UIColor?", "UIColor?"]),
            UIKitsButtonFunction(UIKitName: "ActivityIndicatorView", UIKitFunction: ["activityIndicatorView.startAnimating", "activityIndicatorView.stopAnimating", "activityIndicatorView.style", "activityIndicatorView.color"], UIKitFunctionType: ["()", "()", "Style", "UIColor!"]),
            UIKitsButtonFunction(UIKitName: "ProgressView", UIKitFunction: ["progressView.progressViewStyle", "progressView.progressTintColor", "progressView.trackTintColor"], UIKitFunctionType: ["Style", "UIColor?", "UIColor?"]),
        ]
    }
    
    func getUIKitData() -> [UIKits] {
        return uikitList
    }
    
    func getUIKitCodeData() -> [UIKitsCodeFunction] {
        return codeFunctionList
    }
    
    func getUIKitButtonData() -> [UIKitsButtonFunction] {
        return buttonFunctionList
    }
}
