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
        self.nameSong = object["nameSong"] ?? ""
        self.imageSong = object["imageSong"] ?? ""
        self.idDetail = object["idDetail"] ?? ""
    }
}
