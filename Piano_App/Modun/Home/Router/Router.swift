//
//  Router.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/25/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit
protocol Router {
     func present(manHinh: ListScreen, data: ModelDetailCellSongs)
}

extension HomeController: Router {
    func present(manHinh: ListScreen, data: ModelDetailCellSongs) {
        switch manHinh {
        case ListScreen.InfoSong:
            let vc = InfoSong()
            vc.inject(presnter: InfoSongPresenterImp.init(interacter: InfoSongInteracterImp.init(dataInfoSong: data), router: InfoSongRouterImp(viewController: vc)))
            self.present(vc, animated: false, completion: nil)
        default:
            break
        }
    }
}

enum ListScreen: Int {
    case InfoSong = 1
    case ListSongs = 2
}
