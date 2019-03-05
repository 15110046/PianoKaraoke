//
//  ModelListSongs.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/5/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
struct ModelListSongs {

    var nameSong: String
    var imageSong: String
    var idDetail: String
    init(object:[String: String]) {
        if let dic = object as? Dictionary<String, String> {
            self.nameSong = dic["nameSong"] ?? ""
            self.imageSong = dic["imageSong"] ?? ""
            self.idDetail = dic["idDetail"] ?? ""
        }
        else {
            self.nameSong = ""
            self.imageSong = ""
            self.idDetail = ""
        }
    }
}
