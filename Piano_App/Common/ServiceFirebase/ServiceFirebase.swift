//
//  ServiceFirebase.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/14/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class ServiceOnline {
    static var share = ServiceOnline()
    private var ref = Database.database().reference()
    
    func getData(param: String, comletion: @escaping (_ data: Any?) -> ()) {
        ref.child("OverViewCategoryApp").child(param).observe(.value) { (snapShot) in
            guard let value = snapShot.value else {
                DispatchQueue.main.async {
                    comletion(nil)
                }
                return
            }
            DispatchQueue.main.async {
                comletion(value)
            }
        }
    }
    func getDataListSongs(param: String, comletion: @escaping (_ data: Any?) -> ()) {
        ref.child("OverViewCategoryApp").child(param).child("arraySongs").observe(.value) { (snapShot) in
            guard let value = snapShot.value else {
                DispatchQueue.main.async {
                    comletion(nil)
                }
                return
            }
            DispatchQueue.main.async {
                comletion(value)
            }
        }
    }
    func getDataInfoSong(param: String, comletion: @escaping (_ data: Any?) -> ()) {
        ref.child("DetailSong").child(param).observe(.value) { (snapShot) in
            guard let value = snapShot.value else {
                DispatchQueue.main.async {
                    comletion(nil)
                }
                return
            }
            DispatchQueue.main.async {
                comletion(value)
            }
        }
    }
}
