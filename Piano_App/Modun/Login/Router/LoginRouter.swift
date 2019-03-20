//
//  LoginRouter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/19/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit
protocol LoginRouter {
    func present(uid: String?)
}

extension LoginViewController: LoginRouter {
    func present(uid: String?) {
        let homeVC = HomeController()
        let navigation = UINavigationController(rootViewController: homeVC)
        navigation.setUpUINaviationItem()
        let interactor = InteracterImp(uid: uid)
        homeVC.inject(presenter: HomeControllerPresenterImp(interacter: interactor, router: homeVC))
        self.present(navigation, animated: false, completion: nil)
    }
}
