//
//  Enum.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/27/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

enum NameCell: String {
    case LocalSongs = "LocalSongs"
    case OnlineSongs = "OnlineSongs"
    var result: String {
        return self.rawValue
    }
}
enum ListScreen: Int {
    case InfoSong = 1
    case ListSongs = 2
}
enum TypeCell: Int {
    case CellLocal = 1
    case CellOnline = 2
}
