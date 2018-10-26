//
//  HomeViewController.swift
//  hocUICollecionView
//
//  Created by CPU11966 on 10/26/18.
//  Copyright © 2018 CPU11966. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let leftBarButton = UIBarButtonItem(image: UIImage(named: "icon2"), style: .plain, target: nil, action: nil)
    let rightBarButton = UIBarButtonItem(image: UIImage(named: "icon2"), style: .plain, target: nil, action: nil)
    
    private let hotViewController = HotViewController()
    private let gameViewController = GameViewController()
    private let headerTabView = HomeHeaderTab(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
    
    private let tabScrollView = UIScrollView()
    private lazy var tabViews = [gameViewController, hotViewController]
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
        setupConstraints()
        
        headerTabView.selectButton(headerTabView.gameButton)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        tabBarController?.navigationItem.titleView = headerTabView
        tabBarController?.navigationItem.leftBarButtonItem = leftBarButton
        tabBarController?.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func visualize() {
        view.backgroundColor = .white
        
     }
    
    func setupConstraints() {
        
    }
}
