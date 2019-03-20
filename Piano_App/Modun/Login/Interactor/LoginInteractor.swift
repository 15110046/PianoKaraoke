//
//  LoginInteractor.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/19/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
protocol LoginInteractor {
   func checkLogin(username: String, pass: String, completion: @escaping (LoginResul)->())
    func registerAccountFb(completion: @escaping (String)->())
}
class LoginInteractorImp {
}

extension LoginInteractorImp: LoginInteractor {
    func registerAccountFb(completion: @escaping (String)->()) {
        ServiceFacebook.share.loginFB(graphPath: "me", parameters: ["fields": "email,name,picture"], httpMethod: HttpMethod.GET.result) { [weak self] (data) in
            guard let strongSelf = self,
                let dataExport = data as? Dictionary<String, Any> else { return }
            let accCountFb  = AccountUserModel(data: dataExport)
            DispatchQueue.main.async {
                strongSelf.pushDataToFirebaseService(uid: accCountFb.uid, data: accCountFb)
                completion(accCountFb.uid)
            }
        }
    }
    func pushDataToFirebaseService(uid: String, data: AccountUserModel) {
        ServiceOnline.share.pushData(uid: uid, data: data)
    }
    func checkLogin(username: String, pass: String, completion: @escaping (LoginResul)->()) {
        ServiceOnline.share.checkLogin(email: username, pass: pass) { (result) in
            completion(result)
        }
    }
}