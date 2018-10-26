//
//  Extension.swift
//  hocUICollecionView
//
//  Created by CPU11966 on 10/26/18.
//  Copyright © 2018 CPU11966. All rights reserved.
//

import UIKit

extension UIScrollView {
    func addRefreshControl(_ refreshControl: UIRefreshControl) {
        if #available(iOS 10.0, *) {
            self.refreshControl = refreshControl
        } else {
            self.addSubview(refreshControl)
        }
    }
    
    var currentHorizontalPage: Int {
        guard self.frame.width > 0 else {
            return 0
        }
        return Int((self.contentOffset.x + (0.5 * self.frame.size.width)) / self.frame.width)
    }
    
    var currentVerticalPage: Int {
        guard self.frame.height > 0 else {
            return 0
        }
        return Int((self.contentOffset.y + (0.5 * self.frame.size.height)) / self.frame.height)
    }
}
