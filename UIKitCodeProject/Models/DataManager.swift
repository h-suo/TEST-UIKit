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
            UIKits(UIKitImage: UIImage(named: "Segmented Control"), UIKitName: "Segmented Control"),
            UIKits(UIKitImage: UIImage(named: "Switch"), UIKitName: "Switch"),
            UIKits(UIKitImage: UIImage(named: "Text Field"), UIKitName: "Text Field"),
            UIKits(UIKitImage: UIImage(named: "Slider"), UIKitName: "Slider"),
            UIKits(UIKitImage: UIImage(named: "Stepper"), UIKitName: "Stepper"),
            UIKits(UIKitImage: UIImage(named: "Picker View"), UIKitName: "Picker View"),
            UIKits(UIKitImage: UIImage(named: "Progress View"), UIKitName: "Progress View"),
            UIKits(UIKitImage: UIImage(named: "Page Control"), UIKitName: "Page Control"),
            UIKits(UIKitImage: UIImage(named: "Activity Indicator View"), UIKitName: "Activity Indicator View"),
            UIKits(UIKitImage: UIImage(named: "Color Well"), UIKitName: "Color Well")
        ]
    }
    
    func makeUIKitCodeFunctionData() {
        codeFunctionList = [
            UIKitsCodeFunction(UIKitName: "Label", UIKitFunction: ["label.text", "label.numberOfLines"], UIKitFunctionType: ["String?", "Int" ]),
            UIKitsCodeFunction(UIKitName: "Button", UIKitFunction: ["button.setTitle"], UIKitFunctionType: ["String?"])
        ]
    }
    
    func makeUIKitButtonFunctionData() {
        buttonFunctionList = [
            UIKitsButtonFunction(UIKitName: "Label", UIKitFunction: ["label.font", "label.textColor", "label.textAlignment"], UIKitFunctionType: ["UIFont!", "UIColor!", "NSTextAlignment"]),
            UIKitsButtonFunction(UIKitName: "Label", UIKitFunction: [ "button.setTitleColor"], UIKitFunctionType: ["UIColor?"])
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
