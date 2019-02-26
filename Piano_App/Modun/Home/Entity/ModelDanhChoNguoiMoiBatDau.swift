//
//  ModelDanhChoNguoiMoiBatDau.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/17/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit

struct NhacOnline: ModelHome {
    var viewController: UIViewController? {
       return nil
    }
    
    var heighthSize: CGFloat? {
        return LayoutDanhChoNguoiMoiBatDau.heightDanhChoNguoiMoiBatDau.rawValue
    }
    
    var widthSize: CGFloat? {
        return LayoutDanhChoNguoiMoiBatDau.widthDanhChoNguoiMoiBatDau.rawValue
    }
    
    var background: UIColor? {
        return .white
    }
    
    var arrayNhacOnline: [ArrayNhacOnline] = []
    let title: String?
    init(data: [String: Any]) {
        if let dic = data as? Dictionary<String, Any> {
            self.title = dic["title"] as? String ?? ""
            let dicSongs = dic["arraySongs"] as? [String: [String: Any]] ?? ["":["":""]]
            self.arrayNhacOnline = dicSongs.map{ArrayNhacOnline.init(object: $0.value)}
        }
        else {
            self.arrayNhacOnline = [ArrayNhacOnline]()
            self.title = ""
        }
    }
}
struct ArrayNhacOnline: ModelDetailCellSongs {
    var viewController: UIViewController? {
        return InfoSong()
    }
    
    var heighthSize: CGFloat? {
        return LayoutDanhChoNguoiMoiBatDau.heightCellDanhChoNguoiMoiBatDau.rawValue
    }
    
    var widthSize: CGFloat? {
        return LayoutDanhChoNguoiMoiBatDau.widthCellDanhChoNguoiMoiBatDau.rawValue
    }
    
    var background: UIColor?
    
    var nameSong: String
    var imageSong: String
    var urlMp4: String
    var likes: Int
    init(object:[String: Any]) {
        if let dic = object as? Dictionary<String, Any> {
            self.nameSong = dic["nameSong"] as?     String ?? ""
            self.imageSong = dic["imageSong"] as?   String ?? ""
            self.urlMp4 = dic["urlMp4"] as?         String ?? ""
            self.likes = dic["likes"] as?           Int    ?? 0
        }
        else {
            self.nameSong = ""
            self.imageSong = ""
            self.urlMp4 = ""
            self.likes = 0
        }
    }
}
