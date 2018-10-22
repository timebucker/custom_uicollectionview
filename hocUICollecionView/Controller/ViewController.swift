//
//  ViewController.swift
//  hocUICollecionView
//
//  Created by CPU11966 on 10/19/18.
//  Copyright © 2018 CPU11966. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var contentView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var gameImageList = [UIImage]()
    var hotLiveList = [HotLive]()
    let itemSpace: CGFloat = 5
    let lineSpace: CGFloat = 12

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
        
        gameImageList.append(UIImage(named: "b1")!)
        gameImageList.append(UIImage(named: "b2")!)
        gameImageList.append(UIImage(named: "b3")!)
        gameImageList.append(UIImage(named: "b1")!)
        gameImageList.append(UIImage(named: "b2")!)
        gameImageList.append(UIImage(named: "b3")!)
        gameImageList.append(UIImage(named: "b1")!)
        gameImageList.append(UIImage(named: "b2")!)
        gameImageList.append(UIImage(named: "b3")!)
        
        hotLiveList.append(HotLive(username: "nguyen van a", avatarImage: "b1", thumbnail: "b2"))
        hotLiveList.append(HotLive(username: "nguyen van b", avatarImage: "b2", thumbnail: "b2"))
        hotLiveList.append(HotLive(username: "nguyen van c", avatarImage: "b3", thumbnail: "b2"))
        hotLiveList.append(HotLive(username: "nguyen van d", avatarImage: "b1", thumbnail: "b2"))
        hotLiveList.append(HotLive(username: "nguyen van e", avatarImage: "b2", thumbnail: "b2"))
        hotLiveList.append(HotLive(username: "nguyen van f", avatarImage: "b1", thumbnail: "b2"))
        hotLiveList.append(HotLive(username: "nguyen van g", avatarImage: "b1", thumbnail: "b2"))
    }

    func setupView() {
        view.addSubview(contentView)
        view.backgroundColor = .white
        contentView.dataSource = self
        contentView.delegate = self
        contentView.register(BannerCell.self, forCellWithReuseIdentifier: "BannerCell")
        contentView.register(GameListCell.self, forCellWithReuseIdentifier: "GameListCell")
        contentView.register(HotLiveCell.self, forCellWithReuseIdentifier: "HotLiveCell")
        contentView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader")
        contentView.backgroundColor = .white
        contentView.showsVerticalScrollIndicator = false
    }
        
    func setupConstraint(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            break
        case 1:
            break
        case 2:
            break
        default:
            break
        }
    }

}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return hotLiveList.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = contentView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
            cell.data = UIImage(named: "b1")!
            cell.toDoOnClick = { String in
                print(String)
            }
            return cell
        case 1:
            let cell = contentView.dequeueReusableCell(withReuseIdentifier: "GameListCell", for: indexPath) as! GameListCell
            cell.GameImagesList = gameImageList
            cell.toDoOnClick = {string in
                print(string)
            }
            return cell
        default:
            let cell = contentView.dequeueReusableCell(withReuseIdentifier: "HotLiveCell", for: indexPath) as! HotLiveCell
            cell.data = hotLiveList[indexPath.row]
            cell.itemIndex = indexPath.row
            cell.toDoOnClick = {String in
                print(String)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = contentView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeader
        switch indexPath.section {
        case 1:
            header.data = "Game"
        case 2:
            header.data = "Hot Live"
        default:
            break
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: 0, height: 0)
        default:
            return CGSize(width: contentView.bounds.width, height: 20)
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width:CGFloat = contentView.bounds.width
        switch indexPath.section {
        case 0:
            let height:CGFloat = 120
            return CGSize(width: width, height: height)
        case 1:
            let height:CGFloat = 60
            return CGSize(width: width, height: height)
        default:
            let height:CGFloat = 150
            return CGSize(width: width/2 - itemSpace, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpace
    }
}

