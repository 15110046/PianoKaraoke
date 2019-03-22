//
//  ModelInfoSong.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/2/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

//import Foundation

struct DetailInfoSong {
    var likes: Int
    var urlMp4: String
    var contentKaraoke: String
    var nameSong: String
    var imageSong: String
    var category: String
    var author: String
    var level: Int
    var karaokeLyric: String
    init(data: [String: Any]) {
        self.likes = data["likes"] as? Int ?? 0
        self.urlMp4 = data["urlMp4"] as? String ?? ""
        self.contentKaraoke = data["contentKaraoke"] as? String ?? "Đang cập nhật..."
        self.nameSong = data["nameSong"] as? String ?? ""
        self.imageSong = data["imageSong"] as? String ?? ""
        self.category = data["kindMusic"] as? String ?? ""
        self.author = data["author"] as? String ?? "Chưa biết"
        self.level = data["level"] as? Int ?? 0
        self.karaokeLyric = data["karaokeLyric"] as? String ?? "Đang cập nhật..."
    }
}
