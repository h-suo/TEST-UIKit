//
//  UIKitTableViewCell.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/20.
//

import UIKit

class UIKitTableViewCell: UITableViewCell {
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    let tittleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        self.addSubview(mainImageView)
        self.addSubview(tittleLabel)
    }
    
    override func updateConstraints() {
        setConstraints()
    }
    
    func setConstraints() {
        setMainImageViewConstraints()
        settittleLabelConstraints()
    }
    
    func setMainImageViewConstraints() {
        
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 100),
            mainImageView.widthAnchor.constraint(equalToConstant: 100),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func settittleLabelConstraints() {
        tittleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tittleLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 16),
            tittleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setMainImgaeViewConstrains() {
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
