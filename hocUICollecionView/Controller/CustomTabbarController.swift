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
        
        let homeController = HomeController()
        homeController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        homeController.tabBarItem.title = "Home"
        
        let hotController = ViewController()
//        hotController.tabBarItem.title = "Hot"
        hotController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 1)
        
        viewControllers = [hotController, homeController]
    }
}
