//
//  UIKitTableViewCell.swift
//  UIKitCodeProject
//
//  Created by 표현수 on 2023/01/20.
//

import UIKit

final class UIKitTableViewCell: UITableViewCell {
    
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
        
//        self.addSubview(mainImageView)
        self.addSubview(tittleLabel)
    }
    
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    func setConstraints() {
        setMainImageViewConstraints()
        settittleLabelConstraints()
    }
    
    func setMainImageViewConstraints() {

        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 100),
            mainImageView.widthAnchor.constraint(equalToConstant: 100),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func settittleLabelConstraints() {
        tittleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tittleLabel.heightAnchor.constraint(equalToConstant: 22),
            tittleLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 16),
            tittleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
