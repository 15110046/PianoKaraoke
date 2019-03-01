//
//  HomeControllerPresenter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/12/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol HomeControllerPresenter {
    func dataForRowAt(indexPath: IndexPath) -> ModelHome?
    
    func numberOfItems(in section: Int) -> Int
    
    func collectionViewLayoutHeight(_ collectionView: CollectionHomeViewController, sizeForItemAt indexPath: IndexPath) -> Float
    
    func collectionViewLayoutWidth(_ collectionView: CollectionHomeViewController, sizeForItemAt indexPath: IndexPath) -> Float
    
    func viewDidload(_ collectionView: CollectionHomeViewController, router: Router)
}
class HomeControllerPresenterImp: HomeControllerPresenter {
    var interacter: Interacter?
    var router: Router?
    
    func dataForRowAt(indexPath: IndexPath) -> ModelHome? {
        return interacter?.data[indexPath.row]
    }
    
    func inject(interacter: Interacter, router: Router) {
        self.interacter = interacter
        self.router = router
    }
    
    func viewDidload(_ collectionView: CollectionHomeViewController, router: Router) {
        inject(interacter: InteracterImp(), router: router)
        interacter?.getData(collectionView: collectionView)
    }
    
    func numberOfItems(in section: Int) -> Int {
        return interacter?.data.count ?? 0
    }
    
    func collectionViewLayoutWidth(_ collectionView: CollectionHomeViewController,sizeForItemAt indexPath: IndexPath) -> Float {
        switch interacter?.data[indexPath.row] {
        case is SongsLocal:
            return interacter?.data[indexPath.row].widthSize ?? 0
        case is NhacOnline:
            return interacter?.data[indexPath.row].widthSize ?? 0
        default:
            return 0
        }
    }
    
    func collectionViewLayoutHeight(_ collectionView: CollectionHomeViewController, sizeForItemAt indexPath: IndexPath) -> Float {
        switch interacter?.data[indexPath.row] {
        case is SongsLocal:
            return interacter?.data[indexPath.row].heighthSize ?? 0
        case is NhacOnline:
            return interacter?.data[indexPath.row].heighthSize ?? 0
        default:
            return 0
        }
    }
}
