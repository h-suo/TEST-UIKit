//
//  DetailButtonTableViewCell.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/27.
//

import UIKit
import SnapKit
import Then

class DetailButtonTableViewCell: UITableViewCell {
    
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
    
    let button = UIButton().then {
        $0.showsMenuAsPrimaryAction = true
        $0.backgroundColor = .systemFill
        $0.layer.cornerRadius = 4
    }
    
    func setupStackView() {
        
        self.addSubview(label)
        self.addSubview(equalLabel)
        self.contentView.addSubview(button)
        
        setConstraints()
    }
    
    func setConstraints() {
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
            make.width.equalTo(160)
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
