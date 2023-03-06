//
//  UIKitTableViewCell.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/20.
//

import UIKit
import SnapKit
import Then

final class UIKitTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let mainImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 16
        $0.clipsToBounds = true
    }
    
    let tittleLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    func setupView() {
        
        self.addSubview(mainImageView)
        self.addSubview(tittleLabel)
        
        setConstraints()
    }
    
    func setConstraints() {
        mainImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(90)
        }
        
        tittleLabel.snp.makeConstraints { make in
            make.leading.equalTo(mainImageView.snp.trailing).offset(20)
            make.centerY.equalToSuperview()
            
        }
    }
}
