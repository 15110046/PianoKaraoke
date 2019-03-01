//
//  InfoSongInteracter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/28/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol InfoSongInteracter {
    var dataInfoSong: ModelDetailCellSongs? { get set }
}

class InfoSongInteracterImp: InfoSongInteracter {
    var dataInfoSong: ModelDetailCellSongs?
    
    init(dataInfoSong: ModelDetailCellSongs) {
        self.dataInfoSong = dataInfoSong
    }
    
}
