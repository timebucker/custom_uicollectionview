//
//  MomentViewModel.swift
//  hocUICollecionView
//
//  Created by CPU11966 on 10/25/18.
//  Copyright © 2018 CPU11966. All rights reserved.
//

import Foundation
import RxSwift

class MomentViewModel {
    
    private var idolList = [IdolModel]()
    let idolListVariable = Variable<[IdolModel]>([])
    
    init() {
    
    }
    
    func getDataFromAPI() {
        idolList.append(IdolModel(thumbnail: "b1", username: "A", status: "Status", avatarImage: "b2"))
        idolList.append(IdolModel(thumbnail: "b1", username: "A", status: "Status", avatarImage: "b2"))
        idolList.append(IdolModel(thumbnail: "b1", username: "A", status: "Status", avatarImage: "b2"))
        idolList.append(IdolModel(thumbnail: "b1", username: "A", status: "Status", avatarImage: "b2"))
        idolList.append(IdolModel(thumbnail: "b1", username: "A", status: "Status", avatarImage: "b2"))
        idolList.append(IdolModel(thumbnail: "b1", username: "A", status: "Status", avatarImage: "b2"))
        idolList.append(IdolModel(thumbnail: "b1", username: "A", status: "Status", avatarImage: "b2"))
        idolList.append(IdolModel(thumbnail: "b1", username: "A", status: "Status", avatarImage: "b2"))
        
        idolListVariable.value = idolList
    }
}
