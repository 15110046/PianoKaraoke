//
//  ListSongsPresenter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/4/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
protocol ListSongsPresenter {
    
}
class ListSongsPresenterImp : ListSongsPresenter {
    private var interactor: ListSongsInteractor?
    private var router: ListSongsRouter?
    init(interactor: ListSongsInteractor?, router: ListSongsRouter?) {
        self.interactor = interactor
        self.router = router
    }
}
