//
//  DetailButtonTableViewCell.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/27.
//

import UIKit

class DetailButtonTableViewCell: UITableViewCell {
    
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
    
    let button: UIButton = {
        let pub = UIButton(type: .system)
        pub.showsMenuAsPrimaryAction = true
        pub.backgroundColor = .systemFill
        pub.layer.cornerRadius = 4
        
        return pub
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    func setupStackView() {
        
        self.addSubview(label)
        self.addSubview(equalLabel)
        self.contentView.addSubview(button)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
            make.width.equalTo(172)
        }
        equalLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(button.snp.leading).offset(-12)
        }
        button.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-12)
            make.width.equalTo(160)
        }
    }
}
