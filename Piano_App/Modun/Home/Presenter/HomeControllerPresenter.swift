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
    
    func viewDidload(_ collectionView: HomeControllerInterface)
    
    func presentSearchViewController()
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
    func presentSearchViewController() {
        router?.presentSearchViewController()
    }
    
    func dataForCell() -> [ModelHome]? {
        return interacter?.dataExtra
    }
    
    func viewDidload(_ collectionView: HomeControllerInterface) {
//        inject(interacter: InteracterImp(), router: router)
        interacter?.getData(completionHandler: { (data) in
            collectionView.reloadDataCollectionView()
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
