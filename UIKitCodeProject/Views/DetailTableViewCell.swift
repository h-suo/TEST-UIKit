//
//  DetailTableViewCell.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/24.
//

import UIKit
import SnapKit
import Then

class DetailTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let label = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.numberOfLines = 0
    }
    
    let equalLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.text = " = "
    }
    
    let textField = UITextField().then {
        $0.borderStyle = .roundedRect
        $0.backgroundColor = .systemFill
        $0.clearButtonMode = .always
    }
    
    func setupStackView() {
        
        self.addSubview(label)
        self.addSubview(equalLabel)
        self.contentView.addSubview(textField)
        
        setConstraints()
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
}
