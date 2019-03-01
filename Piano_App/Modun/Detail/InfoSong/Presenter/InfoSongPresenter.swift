//
//  InfoSongPresenter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/28/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol InfoSongPresenter {
    func getData() -> ModelDetailCellSongs
}
class InfoSongPresenterImp: InfoSongPresenter {
    private var interacter: InfoSongInteracter?
    
    init(interacter: InfoSongInteracter) {
        self.interacter = interacter
    }
    func getData() -> ModelDetailCellSongs {
        return interacter?.dataInfoSong ?? SongsLocalDetail.init(image: "", nameSong: "")
    }
}
