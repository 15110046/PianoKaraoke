//
//  InfoSongPresenter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/28/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol InfoSongPresenter {
    func present() 
    func getData(completion: @escaping (Result) -> ())
}
class InfoSongPresenterImp {
    
    private var interacter: InfoSongInteracter?
    private var router: InfoSongRouter?
    
    init(interacter: InfoSongInteracter, router: InfoSongRouter) {
        self.interacter = interacter
        self.router = router
    }
}

extension InfoSongPresenterImp: InfoSongPresenter {
    func present() {
        getData { (result) in
            switch result {
            case .succesWithCellLocal(let dataOffline):
                guard let data = dataOffline as? SongsLocalDetail else { return }
                self.router?.present(link: data.urlSong, nameSong: data.getNameSong(), typeCellInit: TypeCell.CellLocal)
            case .succesWithCellOnline(let dataOnline):
                self.router?.present(link: dataOnline?.urlMp4, nameSong: dataOnline?.nameSong, typeCellInit: TypeCell.CellOnline)
            }
        }
    }
    func getData(completion: @escaping (Result) -> ()) {
        interacter?.getData(completion: { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        })
    }
}
