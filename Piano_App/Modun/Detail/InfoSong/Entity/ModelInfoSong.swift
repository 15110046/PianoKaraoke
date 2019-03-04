//
//  ModelInfoSong.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/2/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

struct DetailInfoSong {
    var likes: Int
    var urlMp4: String
    var contentKaraoke: String
    var nameSong: String
    var imageSong: String
    var category: String
    var author: String
    var level: Int
    init(data: [String: Any]) {
        if let dic = data as? Dictionary<String, Any> {
            self.likes = dic["likes"] as? Int ?? 0
            self.urlMp4 = dic["urlMp4"] as? String ?? ""
            self.contentKaraoke = dic["contentKaraoke"] as? String ?? ""
            self.nameSong = dic["nameSong"] as? String ?? ""
            self.imageSong = dic["imageSong"] as? String ?? ""
            self.category = dic["kindMusic"] as? String ?? ""
            self.author = dic["author"] as? String ?? "Chưa biết"
            self.level = dic["level"] as? Int ?? 0
        }
        else {
            self.likes = 0
            self.urlMp4 = ""
            self.contentKaraoke = ""
            self.nameSong = ""
            self.imageSong = ""
            self.category = ""
            self.author = "Chưa biết"
            self.level = 0
        }
    }
}
