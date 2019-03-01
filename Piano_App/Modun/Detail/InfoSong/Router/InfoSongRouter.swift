//
//  InfoSongRouter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/1/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit

protocol InfoSongRouter {
    var viewController: UIViewController? { get set}
    func present()
}
class InfoSongRouterImp: InfoSongRouter {
    var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    func present() {
        let vc = PianoController()
        viewController?.present(vc, animated: false, completion: nil)
    }
}
