//
//  NhacOnlinePresenter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/27/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol NhacOnlinePresenter {
    func numberOfItemsInSection(section: Int) -> Int
    
    func dataForRowAt(indexPath: IndexPath) -> NhacOnline?
    
    func collectionViewLayoutHeightSize(sizeForItemAt indexPath: IndexPath) -> Float
    
    func collectionViewLayoutWitdhSize(sizeForItemAt indexPath: IndexPath) -> Float
    
    func getTitleForCell() -> String
    
    func present(from cell : TypeCell, manHinh: ListScreen, indexPath: IndexPath?)
    
//    func presentOfViewAll(from cell : TypeCell, manHinh: ListScreen)
}
class NhacOnlinePresenterImp: NhacOnlinePresenter {
    func present(from cell : TypeCell ,manHinh: ListScreen, indexPath: IndexPath?) {
        guard let interacter = interacter else { return }
        router?.present(from: cell, to: manHinh, data: interacter.data.arrayNhacOnline[indexPath?.row ?? 0])
    }
    
    
    func getTitleForCell() -> String {
        guard let interacter = interacter else { return "" }
        return interacter.data.category.rawValue
    }
    private var router: Router?
    
    private var interacter: NhacOnlineInteracter?
    
    init(interacter: NhacOnlineInteracter?, router: Router?) {
        self.interacter = interacter
        self.router = router
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        guard let data = interacter?.data else { return 0 }
        switch data.category {
        case .newbiew:
            return data.arrayNhacOnline.count
        case .chinaSong:
            return data.arrayNhacOnline.count
        case .vietnameseSong:
            return data.arrayNhacOnline.count
        case .unknown:
            return 0
        }
    }
    
    func dataForRowAt(indexPath: IndexPath) -> NhacOnline? {
        return interacter?.data
    }
    
    func collectionViewLayoutHeightSize(sizeForItemAt indexPath: IndexPath) -> Float {
        guard let frame = interacter?.data.arrayNhacOnline[indexPath.row] else {
            return 0
        }
        return frame.heighthSize ?? 0
    }
    
    func collectionViewLayoutWitdhSize(sizeForItemAt indexPath: IndexPath) -> Float {
        guard let frame = interacter?.data.arrayNhacOnline[indexPath.row] else {
            return 0
        }
        return frame.widthSize ?? 0
    }
    
}
