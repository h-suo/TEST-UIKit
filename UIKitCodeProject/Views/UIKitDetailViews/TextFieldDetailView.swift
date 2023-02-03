//
//  TextFieldDetailView.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/31.
//

import UIKit

class TextFieldDetailView: UIView {
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .systemFill
        tf.placeholder = "Text Field"
        
        return tf
    }()
    
    let setupLabel: UILabel = {
        let lab = UILabel()
        lab.text = "textField = UITextField()"
        lab.font = .systemFont(ofSize: 16)
        lab.textColor = .gray
        
        return lab
    }()
    
    let actionView: UIView = {
        let av = UIView()
        av.backgroundColor = .systemFill
        av.layer.cornerRadius = 16
        
        return av
    }()
    
    let codeTableView: UITableView = {
        let ctv = UITableView()
        ctv.backgroundColor = .quaternarySystemFill
        
        return ctv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setupStackView()
    }
    
    func setupStackView() {
        
        self.actionView.addSubview(textField)
        self.addSubview(setupLabel)
        self.addSubview(actionView)
        self.addSubview(codeTableView)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        actionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.height.equalTo(200)
        }
        textField.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.centerX.centerY.equalTo(actionView)
        }
        setupLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.bottom.equalTo(codeTableView.snp.top).offset(-8)
        }
        codeTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(actionView.snp.bottom).offset(40)
        }
    }
}
