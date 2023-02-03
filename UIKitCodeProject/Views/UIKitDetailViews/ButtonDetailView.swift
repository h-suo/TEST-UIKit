//
//  ButtonDetailView.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/24.
//

import UIKit

class ButtonDetailView: UIView {
    
    let button: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Button", for: .normal)
        
        return bt
    }()
    
    let setupLabel: UILabel = {
        let lab = UILabel()
        lab.text = "button = UIButton(type: .system)"
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
        
        self.actionView.addSubview(button)
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
        button.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(20)
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
