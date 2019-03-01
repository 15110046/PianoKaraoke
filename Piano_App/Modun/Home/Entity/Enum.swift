//
//  Enum.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/27/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
enum NameCell: String {
    case LocalSongs = "LocalSongs"
    case OnlineSongs = "OnlineSongs"
    var result: String {
        return self.rawValue
    }
}
