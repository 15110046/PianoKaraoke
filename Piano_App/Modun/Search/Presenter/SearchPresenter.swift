//
//  SearchPresenter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/15/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol SearchPresenter {
    func dismis()
    var numberOfItem: Int { get }
    var numberOfItemAfterSearched: Int { get }
    func dataForCell(at indexPath: IndexPath?) -> [ModelSearch]
    func dataForCellAfterSearch(at indexPath: IndexPath?) -> [ModelSearch]
     func textDidChange(searchText: String)
    func pushTo(key: String)
}

class SearchPresenterImp {
    private var interactor: SearchInteractor?
    private var router: SearchRouter?
    init(interactor: SearchInteractor, router: SearchRouter, tbView: SearchViewControllerInterface) {
        self.interactor = interactor
        self.router = router
      
//        tbView.reloadData()
    }
}
extension SearchPresenterImp: SearchPresenter {
     func pushTo(key: String) {
        router?.pushTo(key: key)
    }
    var numberOfItemAfterSearched: Int {
        return interactor?.getNumberOfDataSearched() ?? 0
    }
    
    func textDidChange(searchText: String) {
        interactor?.textDidChange(searchText: searchText)
    }
    func dataForCellAfterSearch(at indexPath: IndexPath?) -> [ModelSearch] {
        return interactor?.getDataSearched() ?? [ModelSearch]()
    }
    func dataForCell(at indexPath: IndexPath?) -> [ModelSearch] {
        return interactor?.getData() ?? [ModelSearch]()
    }
    var numberOfItem: Int {
        return interactor?.getNumberOfData() ?? 0
    }
    
     func dismis() {
        router?.dismis()
    }
    
}
