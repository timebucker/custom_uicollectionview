//
//  HotLive.swift
//  hocUICollecionView
//
//  Created by CPU11966 on 10/19/18.
//  Copyright © 2018 CPU11966. All rights reserved.
//

import Foundation

class HotLive {
    private var username: String?
    private var avatarImage: String?
    private var thumbnailImage: String?
    
    var Username: String?{
        get{
            return username
        }
    }
    
    var AvatarImage: String?{
        get{
            return avatarImage
        }
    }
    
    var ThumbnailImage: String?{
        get{
            return thumbnailImage
        }
    }
    
    init(username: String, avatarImage: String, thumbnail: String) {
        self.username = username
        self.avatarImage = avatarImage
        self.thumbnailImage = thumbnail
    }
    init(){
        username = ""
        avatarImage = ""
        thumbnailImage = ""
    }
}
