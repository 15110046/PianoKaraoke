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
import FirebaseAuth

enum LoginResul {
    case error(message: String)
    case success(data: AuthDataResult)
}

class ServiceOnline {
    static var share = ServiceOnline()
    private var ref = Database.database().reference()
    func getDataUser(uid: String, comletion: @escaping (_ data: Any?) -> ()) {
        ref.child("User").child(uid).observe(.value) { (snapShot) in
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
    func pushData(uid: String, data: AccountUserModel) {
        ref.child("User").child(uid).setValue(["UID":data.uid, "avata": data.url, "name": data.name])
    }
    func checkLogin(email: String, pass: String, completion: @escaping (LoginResul) -> ()) {
        Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
            if let user = user {
                completion(LoginResul.success(data: user))
            }
            else {
                completion(LoginResul.error(message: error?.localizedDescription ?? ""))
            }
        }
    }
    func getDataSearch(param: String, comletion: @escaping (_ data: Any?) -> ()) {
        ref.child(param).observe(.value) { (snapShot) in
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
