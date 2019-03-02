//
//  LocalSongsPresenter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/27/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol LocalSongsPresenter {
    
    func numberOfItemsIn(section: Int) -> Int
    
    func dataForRowAt(indexPath: IndexPath) -> ModelDetailCellSongs?
    
    func collectionViewLayoutWitdhSize(sizeForItemAt indexPath: IndexPath) -> Float
    
    func collectionViewLayoutHeightSize(sizeForItemAt indexPath: IndexPath) -> Float
    
    func getTitleForCell() -> String
    
    func present(from cell: TypeCell, manHinh: ListScreen, indexPath: IndexPath)
}

class LocalSongsPresenterIml: LocalSongsPresenter {
    private var router: Router?
    
    func getTitleForCell() -> String {
        return interactor?.data.title ?? ""
    }
    
     func present(from cell: TypeCell, manHinh: ListScreen, indexPath: IndexPath) {
        guard let interactor = interactor else { return }
        router?.present(from: cell, to: ListScreen.InfoSong, data: interactor.data.arraySongs[indexPath.row])
    }
    
    private var interactor: LocalSongsInteractor?
    init(interactor: LocalSongsInteractor, router: Router?) {
        self.interactor = interactor
        self.router = router
    }
    
    func collectionViewLayoutHeightSize(sizeForItemAt indexPath: IndexPath) -> Float {
        switch interactor?.data.arraySongs[indexPath.row] {
        case let dataLocal as SongsLocalDetail:
            return dataLocal.heighthSize ?? 0
        default:
            return 0
        }
    }
    
    func collectionViewLayoutWitdhSize(sizeForItemAt indexPath: IndexPath) -> Float {
        switch interactor?.data.arraySongs[indexPath.row] {
        case let dataLocal as SongsLocalDetail:
            return dataLocal.widthSize ?? 0
        default:
            return 0
        }
    }
    
    func dataForRowAt(indexPath: IndexPath) -> ModelDetailCellSongs? {
        return interactor?.data.arraySongs[indexPath.row]
    }
    
    func numberOfItemsIn(section: Int) -> Int {
        return interactor?.data.arraySongs.count ?? 0
    }
    
}
