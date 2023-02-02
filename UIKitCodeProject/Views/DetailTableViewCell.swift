//
//  DetailTableViewCell.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/24.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    let label: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 18)
        lab.numberOfLines = 0
        
        return lab
    }()
    
    let equalLabel: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 18)
        lab.text = " = "
        
        return lab
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .systemFill
        tf.clearButtonMode = .always

        return tf
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    func setupStackView() {
        
        self.addSubview(label)
        self.addSubview(equalLabel)
        self.contentView.addSubview(textField)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
            make.width.equalTo(176)
        }
        equalLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(textField.snp.leading).offset(-12)
        }
        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-12)
            make.width.equalTo(160)
        }
    }
    
    @objc private func textFieldEditingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard let code = textField.text else { return }
        print(code)
    }
    
}
