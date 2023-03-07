//
//  ColorWellDetailView.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/02/03.
//

import UIKit
import SnapKit
import Then

class ColorWellDetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let colorWell = UIColorWell()
    
    let setupLabel = UILabel().then {
        $0.text = "stepper = UIStepper()"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .gray
    }
    
    let actionView = UIView().then {
        $0.backgroundColor = .systemFill
        $0.layer.cornerRadius = 16
    }
    
    let codeTableView = UITableView().then {
        $0.backgroundColor = .quaternarySystemFill
    }
    
    func setupStackView() {
        
        self.actionView.addSubview(colorWell)
        self.addSubview(setupLabel)
        self.addSubview(actionView)
        self.addSubview(codeTableView)
        
        setConstraints()
    }
    
    func setConstraints() {
        actionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.height.equalTo(200)
        }
        colorWell.snp.makeConstraints { make in
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
