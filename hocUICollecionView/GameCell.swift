//
//  GameCell.swift
//  hocUICollecionView
//
//  Created by CPU11966 on 10/19/18.
//  Copyright © 2018 CPU11966. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {
    private var gameImageView = UIImageView()
    public var toDoOnClick:((String)->())? = nil
    public var itemIndex = 0
  
    var data: UIImage? {
        didSet {
            guard let data = data else { return }
            gameImageView.image = data
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
        self.addSubview(gameImageView)
        gameImageView.layer.cornerRadius = 10
        gameImageView.layer.masksToBounds = true
    }
    
    func setupConstraint(){
        gameImageView.translatesAutoresizingMaskIntoConstraints = false
        gameImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        gameImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        gameImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        gameImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    private func addAction(){
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cellOnClick)))
    }
    
    @objc private func cellOnClick(){
        let log = "Game Cell clicked at item \(itemIndex)"
        toDoOnClick!(log)
    }
    
}


