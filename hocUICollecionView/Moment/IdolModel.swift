//
//  IdolModel.swift
//  hocUICollecionView
//
//  Created by CPU11966 on 10/25/18.
//  Copyright © 2018 CPU11966. All rights reserved.
//

import Foundation

class IdolModel {
    public private(set) var thumbnail = ""
    public private(set) var username = ""
    public private(set) var status = ""
    public private(set) var avatarImage = ""
    
    init(thumbnail: String, username: String, status: String, avatarImage: String){
        self.thumbnail = thumbnail
        self.username = username
        self.status = status
        self.avatarImage = avatarImage
    }
    
    init(){
        
    }
    
}
