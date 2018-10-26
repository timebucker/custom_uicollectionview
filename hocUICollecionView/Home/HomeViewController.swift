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
        
        view.addSubview(tabScrollView)
        
        addChild(hotViewController)
        tabScrollView.addSubview(hotViewController.view)
        
        addChild(gameViewController)
        tabScrollView.addSubview(gameViewController.view)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let topHeight: CGFloat = navigationController?.navigationBar.frame.maxY ?? 0
        
        tabScrollView.frame = CGRect(x: 0, y: topHeight, width: view.frame.width, height: view.frame.height - topHeight)
        tabScrollView.contentSize = CGSize(width: tabScrollView.frame.width * CGFloat(tabViews.count), height: tabScrollView.frame.height)
        
        hotViewController.view.frame = CGRect(origin: .zero, size: tabScrollView.frame.size)
        gameViewController.view.frame = hotViewController.view.frame.offsetBy(dx: hotViewController.view.frame.width, dy: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        tabBarController?.navigationItem.titleView = headerTabView
        tabBarController?.navigationItem.leftBarButtonItem = leftBarButton
        tabBarController?.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func visualize() {
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        tabScrollView.scrollsToTop = false
        tabScrollView.isPagingEnabled = true
        tabScrollView.bounces = false
        tabScrollView.bouncesZoom = false
        tabScrollView.showsVerticalScrollIndicator = false
        tabScrollView.showsHorizontalScrollIndicator = false
        
        headerTabView.delegate = self
     }
    
    func setupConstraints() {
        
    }
}

extension HomeViewController: HomeHeaderTabDelegate {
    func headerTabDidSelected(_ headerTab: HomeHeaderTab, button: UIButton) {
        guard let index = headerTab.tabButtons.index(of: button) else { return }
        let offset = CGFloat(index) * tabScrollView.frame.width
        tabScrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
    }
    
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate == false {
            headerTabView.selectButton(headerTabView.tabButtons[tabScrollView.currentHorizontalPage])
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        headerTabView.selectButton(headerTabView.tabButtons[tabScrollView.currentHorizontalPage])
    }
}
