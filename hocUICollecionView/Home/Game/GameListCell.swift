//
//  GameListCell.swift
//  hocUICollecionView
//
//  Created by CPU11966 on 10/19/18.
//  Copyright © 2018 CPU11966. All rights reserved.
//

import UIKit

class GameListCell: UICollectionViewCell{
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var gameImagesList = [UIImage]()
    public var toDoOnClick: ((String)->())? = nil
    
    public var GameImagesList: [UIImage] = [] {
        didSet {
            gameImagesList = GameImagesList
            collectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstrain()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.backgroundColor = .white
        self.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        
        collectionView.register(GameCell.self, forCellWithReuseIdentifier: "GameCell")
    }
    
    func setupConstrain(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }

}

extension GameListCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameImagesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
        cell.data = GameImagesList[indexPath.row]
        cell.itemIndex = indexPath.row
        cell.toDoOnClick = {string in
            self.toDoOnClick!(string)
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

extension GameListCell: UICollectionViewDelegate {
    
}

extension GameListCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
