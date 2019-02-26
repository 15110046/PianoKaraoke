//
//  ModelSongKaraokeLocal.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 10/15/18.
//  Copyright © 2018 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit
struct SongKaraokeModel {
    let nameSong: String
    var heightCell: CGFloat {
        return 80
    }
    var font: UIFont? {
        return UIFont(name: nameSong, size: 18)
    }
    let colorName: UIColor
    let backgroundCell: UIColor
    
    init(nameSong: String, colorName: UIColor, backgroundCell: UIColor) {
        self.nameSong       = nameSong
        self.colorName      = colorName
        self.backgroundCell = backgroundCell
    }
}
