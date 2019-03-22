//
//  HomeControllerPresenter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/12/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol HomeControllerPresenter {
    func dataForCell() -> [ModelHome]?
    
    func numberOfItems(in section: Int) -> Int
    
    func collectionViewLayoutHeight(_ collectionView: HomeControllerInterface, sizeForItemAt indexPath: IndexPath) -> Float
    
    func collectionViewLayoutWidth(_ collectionView: HomeControllerInterface, sizeForItemAt indexPath: IndexPath) -> Float
    
    func viewDidload(_ reloadData: HomeControllerInterface)
    
    func presentSearchViewController()
    
    func numberOfRow() -> Int
    
    func dataForRowTableView() -> [SiderTableView]
}
class HomeControllerPresenterImp {
    private var interacter: Interacter?
    private var router: Router?
//    func inject(interacter: Interacter, router: Router) {
//        self.interacter = interacter
//        self.router = router
//    }
    init(interacter: Interacter, router: Router) {
        self.interacter = interacter
        self.router = router
    }
}

extension HomeControllerPresenterImp: HomeControllerPresenter {
     func dataForRowTableView() -> [SiderTableView] {
        return interacter?.dataUserExtra ?? []
    }
    func numberOfRow() -> Int {
        return interacter?.dataUserExtra.count ?? 0
    }
    func presentSearchViewController() {
        router?.presentSearchViewController()
    }
    
    func dataForCell() -> [ModelHome]? {
        return interacter?.dataExtra
    }
    
    func viewDidload(_ reloadData: HomeControllerInterface) {
        interacter?.getData(completionHandler: {
            reloadData.reloadDataCollectionView()
        })
        interacter?.getInfoUserFormServiceOnline(completion: {
            reloadData.reloadDataTableView()
        })
    }
    
    func numberOfItems(in section: Int) -> Int {
        return interacter?.dataExtra.count ?? 0
    }
    
    func collectionViewLayoutWidth(_ collectionView: HomeControllerInterface,sizeForItemAt indexPath: IndexPath) -> Float {
        switch interacter?.dataExtra[indexPath.row] {
        case is SongsLocal:
            return interacter?.dataExtra[indexPath.row].widthSize ?? 0
        case is NhacOnline:
            return interacter?.dataExtra[indexPath.row].widthSize ?? 0
        default:
            return 0
        }
    }
    
    func collectionViewLayoutHeight(_ collectionView: HomeControllerInterface, sizeForItemAt indexPath: IndexPath) -> Float {
        switch interacter?.dataExtra[indexPath.row] {
        case is SongsLocal:
            return interacter?.dataExtra[indexPath.row].heighthSize ?? 0
        case is NhacOnline:
            return interacter?.dataExtra[indexPath.row].heighthSize ?? 0
        default:
            return 0
        }
    }
}
