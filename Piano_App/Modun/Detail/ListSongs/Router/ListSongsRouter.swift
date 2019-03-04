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
    func present(link: String?, nameSong: String?, typeCellInit: TypeCell?)
}
class ListSongsRouterImp: ListSongsRouter {
    var navtionController: UINavigationController?
    
    init(navtionController: UINavigationController?) {
        self.navtionController = navtionController
    }
    func present(link: String?,nameSong: String?, typeCellInit: TypeCell?) {
        let vc = instantiate(ViewController.self)
        vc.config(link: link, nameSong: nameSong, typeCellInitViewController: typeCellInit)
        navtionController?.pushViewController(vc, animated: true)
        navtionController?.isNavigationBarHidden = false
    }
}
