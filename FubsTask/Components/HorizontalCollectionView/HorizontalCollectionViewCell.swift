//
//  HorizontalCollectionViewCell.swift
//  FubsTask
//
//  Created by Gökhan Aras on 15.06.2022.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    
    private let containerView = UIView()
    let contentImage:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel = Label(type: .title,fontType: .bold, aligment: .left)
    let subTitleLabel = Label(type: .info, aligment: .left)

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentImage.translatesAutoresizingMaskIntoConstraints  = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 12
        self.contentView.addSubview(containerView)
        self.containerView.addSubview(contentImage)
        self.containerView.addSubview(titleLabel)
        self.containerView.addSubview(subTitleLabel)
        subTitleLabel.numberOfLines = 0
        containerView.backgroundColor = .white
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            containerView.heightAnchor.constraint(equalToConstant: 170),
            containerView.widthAnchor.constraint(equalToConstant: 276),
            contentImage.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 0),
            contentImage.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: -10),
            contentImage.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 38),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentImage.trailingAnchor, constant: 7),
            titleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -7),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.contentImage.trailingAnchor, constant: 7),
            subTitleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -7),
            subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 11),
        ])
    }
    
}
