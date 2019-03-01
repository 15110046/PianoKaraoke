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
    func present()
}
class InfoSongPresenterImp: InfoSongPresenter {
    private var interacter: InfoSongInteracter?
    private var router: InfoSongRouter?
    func present() {
       router?.present()
    }
    
    init(interacter: InfoSongInteracter, router: InfoSongRouter) {
        self.interacter = interacter
        self.router = router
    }
    func getData() -> ModelDetailCellSongs {
        return interacter?.dataInfoSong ?? SongsLocalDetail.init(image: "", nameSong: "")
    }
}
