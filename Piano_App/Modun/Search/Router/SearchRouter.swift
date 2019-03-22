//
//  SearchRouter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/15/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit
protocol SearchRouter {
    func dismis()
    func pushTo(key: String)
}
class SearchRouterImp {
    private var navigationController: UINavigationController?
    private var viewController: UIViewController?
    init(navigationController: UINavigationController?, viewController: UIViewController) {
        self.viewController = viewController
        self.navigationController = navigationController
    }
}
extension SearchRouterImp: SearchRouter {
    func dismis() {
        viewController?.dismiss(animated: false, completion: nil)
    }
    func pushTo(key: String) {
        let vc = InfoSong()
        vc.inject(presnter: InfoSongPresenterImp(interacter: InfoSongInteracterImp(keyIdDetail: key, dataLocal: nil), router: InfoSongRouterImp(viewController: vc)))
        navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.navigationBar.isHidden = false
    }
}
