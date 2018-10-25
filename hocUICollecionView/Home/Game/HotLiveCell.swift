//
//  HotLiveCell.swift
//  hocUICollecionView
//
//  Created by CPU11966 on 10/19/18.
//  Copyright © 2018 CPU11966. All rights reserved.
//

import UIKit

final class HotLiveCell: UICollectionViewCell {
    
    private var thumbnailImageView = UIImageView()
    private var avatarImageView = UIImageView()
    private var username = UILabel()
    public var toDoOnClick: ((String) -> ())? = nil
    public var itemIndex: Int = 0
    
    var data = HotLive(){
        didSet{
            thumbnailImageView.image = UIImage(named: data.ThumbnailImage!)
            avatarImageView.image = UIImage(named: data.AvatarImage!)
            username.text = data.Username
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraint()
        addAction()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(thumbnailImageView)
        addSubview(avatarImageView)
        addSubview(username)
        
        avatarImageView.layer.cornerRadius = 18
        avatarImageView.layer.masksToBounds = true
        
        
    }
    
    func setupConstraint(){
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75).isActive = true
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 5).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        
        username.translatesAutoresizingMaskIntoConstraints = false
        username.topAnchor.constraint(equalTo: avatarImageView.topAnchor).isActive = true
        username.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 5).isActive = true
        username.heightAnchor.constraint(equalToConstant: 100)
    }
    
    private func addAction(){
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CellOnClick)))
        self.isUserInteractionEnabled = true
    }
    
    @objc private func CellOnClick(sender: UITapGestureRecognizer){
        let log = "Hot Live Clicked at item \(itemIndex)"
        toDoOnClick!(log)
    }
}
