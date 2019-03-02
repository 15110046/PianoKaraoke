//
//  ModelSongLocal.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/17/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit

struct SongsLocal: ModelHome {
    var heighthSize: Float? {
        return GetFramUIScreen.share.getHeightUIScreen()/4
    }
    
    var widthSize: Float? {
        return GetFramUIScreen.share.getWitdhUIScreen()
    }
    

    
    let arraySongs: [ModelDetailCellSongs]
    let title: String?
    init(title: String, arraySongs: [ModelDetailCellSongs]) {
        self.title = title
        self.arraySongs = arraySongs
    }
}

struct SongsLocalDetail: ModelDetailCellSongs {
    var heighthSize: Float? {
        return GetFramUIScreen.share.getHeightUIScreen()/4 - 50
    }
    
    var widthSize: Float? {
        return 0.7*GetFramUIScreen.share.getWitdhUIScreen()
    }

    private let image: UIImage?
    private let nameSong: String?
    
    init(image: String, nameSong: String) {
        self.image = UIImage.init(named: image)
        self.nameSong = nameSong
    }
    
    func getImageSong() -> UIImage? {
        return image
    }
    func getNameSong() -> String? {
        return nameSong
    }
}
