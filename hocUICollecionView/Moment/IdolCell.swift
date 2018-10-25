//
//  IdolCell.swift
//  hocUICollecionView
//
//  Created by CPU11966 on 10/25/18.
//  Copyright © 2018 CPU11966. All rights reserved.
//

import UIKit

class IdolCell: UICollectionViewCell {
    private var thumbnailImageView = UIImageView()
    private var status = UILabel()
    private var avatarImageView = UIImageView()
    private var username = UILabel()
    
    public var data = IdolModel() {
        didSet{
            thumbnailImageView.image = UIImage(named: data.thumbnail)
            status.text = data.status
            avatarImageView.image = UIImage(named: data.avatarImage)
            username.text = data.username
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(status)
        addSubview(avatarImageView)
        addSubview(username)
        
        thumbnailImageView.layer.cornerRadius = 10
        thumbnailImageView.layer.masksToBounds = true
        
        avatarImageView.layer.cornerRadius = 9.4
        avatarImageView.layer.masksToBounds = true
        
        status.font = status.font.withSize(13.2)
        
        username.font = username.font.withSize(13.2)
    }
    
    func setupConstraints() {
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -11.8).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 9).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 18.8).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 18.8).isActive = true
        
        status.translatesAutoresizingMaskIntoConstraints = false
        status.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40.6).isActive = true
        status.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor).isActive = true
        status.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -9.2).isActive = true
        
        username.translatesAutoresizingMaskIntoConstraints = false
        username.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35.3).isActive = true
        username.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64.8).isActive = true
        username.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12.7).isActive = true
        
    }
}
