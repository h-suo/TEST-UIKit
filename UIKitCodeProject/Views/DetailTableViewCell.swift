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
        
        return lab
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .systemFill
        tf.placeholder = "코드를 입력하십시오."
        
        return tf
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    func setupStackView() {
        
        self.addSubview(label)
        self.addSubview(textField)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
        }
        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(label.snp.trailing).offset(8)
            make.width.equalTo(160)
        }
    }
    
}
