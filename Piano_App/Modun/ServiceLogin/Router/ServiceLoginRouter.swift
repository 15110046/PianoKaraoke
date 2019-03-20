//
//  ServiceLoginRouter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/19/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
protocol ServiceLoginRouter {
    func presentToLogin()
    func pushToHome()
}
extension ServiceLoginViewController: ServiceLoginRouter {
    func presentToLogin() {
        let vcLogin = LoginViewController()
        vcLogin.inject(presenter: LoginPresenterImp(interactor: LoginInteractorImp(), router: vcLogin))
        self.present(vcLogin, animated: false, completion: nil)
    }
    func pushToHome() {
        let vc = HomeController()
//        vc.inject(presenter: HomeControllerPresenterImp())
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
