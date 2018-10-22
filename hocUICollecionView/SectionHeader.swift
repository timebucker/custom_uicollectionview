//
//  SectionHeader.swift
//  uicollectionview
//
//  Created by dev on 10/21/18.
//  Copyright © 2018 dev. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    public var sectionTitle = UILabel()
    
    public var data: String = ""{
        didSet{
            sectionTitle.text = data
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.addSubview(sectionTitle)
    }
    
    func setupConstraint(){
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        sectionTitle.topAnchor.constraint(equalTo: topAnchor).isActive = true
        sectionTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 4)
    }
}
