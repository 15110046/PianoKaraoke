//
//  ServiceLoginPresenter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/19/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
protocol ServiceLoginPresenter {
    func checkMoveToScreen()
}
class ServiceLoginPresenterImp  {
    private var interactor: ServiceLoginInteractor?
    private var router: ServiceLoginRouter?
    init(interactor: ServiceLoginInteractor?, router: ServiceLoginRouter?) {
        self.interactor = interactor
        self.router = router
    }
    
}
extension ServiceLoginPresenterImp : ServiceLoginPresenter {
    func checkMoveToScreen() {
        if interactor?.uID == "" {
            router?.presentToLogin()
        }
        else {
            router?.pushToHome()
        }
    }
}
