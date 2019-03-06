//
//  ListSongsRouter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/4/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit

protocol ListSongsRouter {
    var navtionController: UINavigationController? { get set}
    func present(keyIdDetail: String?)
}
class ListSongsRouterImp: ListSongsRouter {
    var navtionController: UINavigationController?
    
    init(navtionController: UINavigationController?) {
        self.navtionController = navtionController
    }
    func present(keyIdDetail: String?) {
        let vc = InfoSong()
        vc.inject(presnter: InfoSongPresenterImp(interacter: InfoSongInteracterImp(keyIdDetail: keyIdDetail, dataLocal: nil), router: InfoSongRouterImp(navtionController: navtionController)))
        navtionController?.pushViewController(vc, animated: false)
        navtionController?.isNavigationBarHidden = false
    }
}
