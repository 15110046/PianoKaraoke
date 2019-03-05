//
//  UseCaseFirebase.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/5/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

class UseCaseFirebase {
    class func getData(key: String, completion: @escaping ([ModelListSongs]) -> ()) {
        ServiceFirebase.share.ref.child("OverViewCategoryApp").child(key).child("arraySongs").observeSingleEvent(of: .value, with: { (snapshot) in
            guard let data = snapshot.value  as? [String: [String: String]] else { return }
            var arrayData = [ModelListSongs]()
            for (index, value) in data {
                arrayData.append(ModelListSongs.init(object: value))
            }
            completion(arrayData)
        })
    }
}
