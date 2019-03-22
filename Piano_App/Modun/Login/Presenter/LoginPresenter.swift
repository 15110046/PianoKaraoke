//
//  LoginPresenter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/19/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
protocol LoginPresenter {
    func moveToHome(username: String, passwd: String, alert: LoginViewControllerInterface)
    func moveToScreen()
}
class LoginPresenterImp {
    private var interactor: LoginInteractor?
    private var router: LoginRouter?
    
    init(interactor: LoginInteractor?, router: LoginRouter?) {
        self.interactor = interactor
        self.router = router
    }
}
extension LoginPresenterImp: LoginPresenter {
    func moveToScreen() {
//        interactor?.registerAccountFb(completion: { [weak self] (uid) in
//            guard let strongSelf = self else { return }
//            strongSelf.interactor?.registerAccountFb(completion: { (uid) in
//                 strongSelf.router?.present(uid: uid)
//            })
//
//        })
        interactor?.paserDataFormFbSDK(completion: { [weak self](dataFb) in
            guard let strongSelf = self else { return }
            
            DispatchQueue.main.async {
                strongSelf.interactor?.pushDataToFirebaseService(uid: dataFb.uid, data: dataFb)
                
                strongSelf.router?.present(uid: dataFb.uid)
            }
        })
    }
    func moveToHome(username: String, passwd: String, alert: LoginViewControllerInterface) {
        interactor?.checkLogin(username: username, pass: passwd, completion: { [weak self] (result) in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let data):
                UserDefaults.standard.set(data.user.uid, forKey: "UID")
                strongSelf.router?.present(uid: data.user.uid)
            case .error(let error):
                alert.showAlert(stringTitle: "Error", stringMessages: error)
            }
        })
       
    }
}

