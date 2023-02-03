//
//  SliderDetailView.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/02/02.
//

import UIKit

class SliderDetailView: UIView {
    
    let slider: UISlider = {
        let sd = UISlider()
        
        return sd
    }()
    
    let label: UILabel = {
        let lab = UILabel()
        
        return lab
    }()
    
    let setupLabel: UILabel = {
        let lab = UILabel()
        lab.text = "slider = UISlider()"
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
        
        self.actionView.addSubview(label)
        self.actionView.addSubview(slider)
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
        label.snp.makeConstraints { make in
            make.centerX.equalTo(actionView)
            make.bottom.equalTo(slider.snp.top).offset(-20)
        }
        slider.snp.makeConstraints { make in
            make.width.equalTo(140)
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
