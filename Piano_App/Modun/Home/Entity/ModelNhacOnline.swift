//
//  ModelDanhChoNguoiMoiBatDau.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/17/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
//import UIKit

struct NhacOnline: ModelHome {
    var heighthSize: Float? {
        return Float(LayoutDanhChoNguoiMoiBatDau.heightDanhChoNguoiMoiBatDau.rawValue)
    }
    
    var widthSize: Float? {
        return Float(LayoutDanhChoNguoiMoiBatDau.widthDanhChoNguoiMoiBatDau.rawValue)
    }
    
    var arrayNhacOnline: [ArrayNhacOnline] = []
    let title: String?
    init(data: [String: Any]) {
        self.title = data["title"] as? String ?? ""
        let dicSongs = data["arraySongs"] as? [String: [String: Any]] ?? ["":["":""]]
        self.arrayNhacOnline = dicSongs.map{ArrayNhacOnline.init(object: $0.value)}
    }
}
struct ArrayNhacOnline: ModelDetailCellSongs {
    var heighthSize: Float? {
        return LayoutDanhChoNguoiMoiBatDau.heightCellDanhChoNguoiMoiBatDau.rawValue
    }
    
    var widthSize: Float? {
        return LayoutDanhChoNguoiMoiBatDau.widthCellDanhChoNguoiMoiBatDau.rawValue
    }
    
    
    var nameSong: String
    var imageSong: String
    var idDetail: String
//    var urlMp4: String
//    var likes: Int
    init(object:[String: Any]) {
        if let dic = object as? Dictionary<String, Any> {
            self.nameSong = dic["nameSong"] as?     String ?? ""
            self.imageSong = dic["imageSong"] as?   String ?? ""
            self.idDetail = dic["idDetail"] as?         String ?? ""
        }
        else {
            self.nameSong = ""
            self.imageSong = ""
            self.idDetail = ""
        }
    }
}
