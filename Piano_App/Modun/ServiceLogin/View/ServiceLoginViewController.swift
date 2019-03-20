//
//  ServiceLoginViewController.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/18/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import UIKit

class ServiceLoginViewController: UIViewController {
    private var presenter: ServiceLoginPresenter?
    func inject(presenter: ServiceLoginPresenter?) {
        self.presenter = presenter
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        presenter = ServiceLoginPresenterImp(interactor: ServiceLoginInteractorImp(), router: self)
        checkMoveToScreen()
    }
    private func checkMoveToScreen() {
        presenter?.checkMoveToScreen()
    }

}
