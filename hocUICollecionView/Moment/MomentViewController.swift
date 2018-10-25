//
//  MomentViewController.swift
//  hocUICollecionView
//
//  Created by CPU11966 on 10/25/18.
//  Copyright © 2018 CPU11966. All rights reserved.
//

import UIKit
import RxSwift

class MomentViewController: UIViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let itemSpace: CGFloat = 5
    let rowSpace: CGFloat = 5
    let titleView = UILabel(frame: CGRect(x: 0, y: 0, width: 75, height: 18))
    let leftBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icon"), style: .plain, target: nil, action: nil)
    let rightBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icon"), style: .plain, target: nil, action: nil)
    let momentViewModel = MomentViewModel()
    var idolList = [IdolModel]()
    
    private let bag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        bind()
        
        momentViewModel.getDataFromAPI()
        
        
    }
    
    func setupViews() {
        titleView.text = "MOMENT"
        navigationItem.titleView = titleView
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton

        tabBarController?.navigationItem.titleView = titleView
        tabBarController?.navigationItem.leftBarButtonItem = leftBarButton
        tabBarController?.navigationItem.rightBarButtonItem = rightBarButton
        
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(IdolCell.self, forCellWithReuseIdentifier: "IdolCell")
        collectionView.backgroundColor = .white
    }
    
    func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func bind() {
        momentViewModel.idolListVariable.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] idolList in
                guard let me = self else { return }
                me.idolList = idolList
                me.collectionView.reloadData()
            })
            .disposed(by: bag)
    }
    
}

extension MomentViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return idolList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "IdolCell", for: indexPath)
    }
    
    
}

extension MomentViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? IdolCell else{return}
        cell.data = idolList[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width - itemSpace)/2, height: 229.4 * UIScreen.main.bounds.height / 667)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return rowSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpace
    }
}

extension MomentViewController: UICollectionViewDelegateFlowLayout {
    
}
