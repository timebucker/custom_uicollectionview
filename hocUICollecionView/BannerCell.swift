//
//  BannerCell.swift
//  hocUICollecionView
//
//  Created by CPU11966 on 10/19/18.
//  Copyright © 2018 CPU11966. All rights reserved.
//

import UIKit

final class BannerCell: UICollectionViewCell {
    
    private var bannerImageView = UIImageView()
    public var toDoOnClick:((String) -> ())? = nil
    
    public var data = UIImage() {
        didSet{
            bannerImageView.image = data
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraint()
        addAction()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.addSubview(bannerImageView)
    }
    
    private func setupConstraint(){
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        bannerImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bannerImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bannerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bannerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func addAction(){
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cellOnClick)))
        self.isUserInteractionEnabled = true
    }
    
    @objc private func cellOnClick(){
        let log = "Banner clicked"
        toDoOnClick!(log)
    }
    
}

