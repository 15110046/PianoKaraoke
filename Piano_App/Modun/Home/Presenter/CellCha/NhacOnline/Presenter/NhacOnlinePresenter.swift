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
}
class NhacOnlinePresenterImp: NhacOnlinePresenter {
    func getTitleForCell() -> String {
        return interacter?.data.title ?? ""
    }
    
    
    var interacter: NhacOnlineInteracter?
    
    init(interacter: NhacOnlineInteracter?) {
        self.interacter = interacter
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return interacter?.data.arrayNhacOnline.count ?? 0
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
