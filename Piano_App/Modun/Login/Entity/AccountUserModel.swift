//
//  AccountUserModel.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/20/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

struct AccountUserModel {
    var uid: String
    var name: String
    var url: String
    init(data: Dictionary<String, Any>) {
        self.uid = data["id"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        let pictDict =  data["picture"] as? [String: Any] ?? [:]
        let pictureUrl = pictDict["data"] as? [String: Any] ?? [:]
        self.url = pictureUrl["url"] as? String ?? ""
    }
}

