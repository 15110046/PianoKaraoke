//
//  ModelNhacViet.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/17/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit

struct NhacViet: ModelHome {
    var viewController: UIViewController? {
        return nil
    }
    
    var heighthSize: CGFloat? {
        return LayoutNhacViet.heightNhacViet.rawValue
    }
    
    var widthSize: CGFloat? {
        return LayoutNhacViet.widthNhacViet.rawValue
    }
    
    var background: UIColor? {
        return .white
    }
    
    var arrayNhacViet: [AraySongsNhacViet] = []
    let title: String?
    init(data: [String: Any]) {
        if let dic = data as? Dictionary<String, Any> {
            self.title = dic["title"] as? String ?? ""
            let dicSongs = dic["arraySongs"] as? [String: [String: Any]] ?? ["":["":""]]
            self.arrayNhacViet = dicSongs.map{AraySongsNhacViet.init(object: $0.value)}
        }
        else {
            self.arrayNhacViet = [AraySongsNhacViet]()
            self.title = ""
        }
    }
}
struct AraySongsNhacViet: ModelDetailCellSongs {
    var viewController: UIViewController? {
        return InfoSong()
    }
    
    var heighthSize: CGFloat? {
        return LayoutNhacViet.heightCellNhacViet.rawValue
    }
    
    var widthSize: CGFloat? {
        return LayoutNhacViet.widthCellNhacViet.rawValue
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
