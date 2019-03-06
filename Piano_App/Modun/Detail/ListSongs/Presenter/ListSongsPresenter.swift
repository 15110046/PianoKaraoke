//
//  ListSongsPresenter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/4/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
protocol ListSongsPresenter {
    func getData() -> [ModelListSongs]
    func numberOfItem() -> Int
    func present(keyIdDetail: String?)
}
class ListSongsPresenterImp : ListSongsPresenter {
    func getData() -> [ModelListSongs] {
        return interactor?.dataListSongs ?? [ModelListSongs]()
    }
    func numberOfItem() -> Int {
        return interactor?.dataListSongs?.count ?? 0
    }
    fileprivate var interactor: ListSongsInteractor?
    fileprivate var router: ListSongsRouter?
    init(interactor: ListSongsInteractor?, router: ListSongsRouter?) {
        self.interactor = interactor
        self.router = router
    }
     func present(keyIdDetail: String?) {
        router?.present(keyIdDetail: keyIdDetail)
    }
 
}



