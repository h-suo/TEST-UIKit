//
//  LabelDetailViews.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/24.
//

import UIKit

class LabelDetailView: UIView {
    
    let actionView: UIView = {
        let av = UIView()
        av.backgroundColor = .systemFill
        av.layer.cornerRadius = 16
        
        return av
    }()
    
    let label: UILabel = {
        let l = UILabel()
        
        return l
    }()
    
    let codeTableView: UITableView = {
        let ctv = UITableView()
        ctv.backgroundColor = .systemFill
        
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
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.height.equalTo(250)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(actionView)
        }
        
        codeTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(actionView.snp.bottom).offset(40)
        }
    }
    
}
