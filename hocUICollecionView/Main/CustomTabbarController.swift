//
//  CustomTabbarController.swift
//  hocUICollecionView
//
//  Created by CPU11966 on 10/22/18.
//  Copyright © 2018 CPU11966. All rights reserved.
//

import UIKit

class CustomTabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gameViewController = GameViewController()
        gameViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        gameViewController.tabBarItem.title = "Home"
        
        let momentViewController = MomentViewController()
        momentViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        momentViewController.tabBarItem.title = "Moment"
        
        
        viewControllers = [momentViewController, gameViewController]
    }
}
