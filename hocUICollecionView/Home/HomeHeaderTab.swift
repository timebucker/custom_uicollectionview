//
//  HomeHeaderTab.swift
//  hocUICollecionView
//
//  Created by CPU11966 on 10/26/18.
//  Copyright © 2018 CPU11966. All rights reserved.
//

import UIKit

protocol HomeHeaderTabDelegate: class {
    func headerTabDidSelected(_ headerTab: HomeHeaderTab, button: UIButton)
}

final class HomeHeaderTab: UIView {
    let hotButton = UIButton()
    let gameButton = UIButton()
    let buttonTitles = ["Hot","Game"]
    private(set) lazy var tabButtons = [hotButton, gameButton]
    
    weak var delegate: HomeHeaderTabDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        visualize()
        setupConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func visualize() {
        
        for (index, button) in tabButtons.enumerated() {
            addSubview(button)
            button.setTitleColor(UIColor.black, for: .normal)
            button.setTitleColor(UIColor.yellow, for: .highlighted)
            button.setTitleColor(UIColor.red, for: .selected)
            button.setTitle(buttonTitles[index], for: .normal)
            button.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
        }
    }
    
    func setupConstraint() {
        
        hotButton.sizeToFit()
        gameButton.sizeToFit()
        
        let hButton: CGFloat = 30
        let padding: CGFloat = 10
        let xSpacing = (bounds.width - hotButton.frame.width - gameButton.frame.width - padding) / 2
        
        let xHotButton: CGFloat = bounds.minX + xSpacing
        let yHotButton: CGFloat = floor(bounds.midY - hButton / 2)
        
        hotButton.frame.size.height = hButton
        hotButton.frame.origin = CGPoint(x: xHotButton, y: yHotButton)
        
        let xDiscoverButton = hotButton.frame.maxX + padding
        let yDiscoverButton = yHotButton
        
        gameButton.frame.size.height = hButton
        gameButton.frame.origin = CGPoint(x: xDiscoverButton, y: yDiscoverButton)
    }
    
    @objc func selectButton(_ button: UIButton) {
        for button in tabButtons {
            button.isSelected = false
        }
        
        button.isSelected = true
        delegate?.headerTabDidSelected(self, button: button)
    }
}
