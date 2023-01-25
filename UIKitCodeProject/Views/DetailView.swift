//
//  DetailView.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/23.
//

import UIKit

class DetailView: UIView {
    
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
        
        codeTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(actionView.snp.bottom).offset(40)
        }
    }
    
}
