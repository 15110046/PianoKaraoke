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
    func present(from screen : TypeCell ,to manHinh: ListScreen, data: ModelDetailCellSongs)
}

extension HomeController: Router {
    func present(from cell : TypeCell ,to manHinh: ListScreen, data: ModelDetailCellSongs) {
        switch cell {
        case TypeCell.CellLocal: 
                    switch manHinh {
                    case ListScreen.InfoSong:
                        let vc = InfoSong()
                        vc.inject(presnter: InfoSongPresenterImp.init(interacter: InfoSongInteracterImp.init(keyIdDetail: nil, dataLocal: data), router: InfoSongRouterImp(viewController: vc)))
                        self.present(vc, animated: false, completion: nil)
                    default:
                        break
                }
        case TypeCell.CellOnline:
            guard let keyIdDetailInfoSong = data as? ArrayNhacOnline else {
                return
            }
            switch manHinh {
            case ListScreen.InfoSong:
                let vc = InfoSong()
                vc.inject(presnter: InfoSongPresenterImp.init(interacter: InfoSongInteracterImp.init(keyIdDetail: keyIdDetailInfoSong.idDetail, dataLocal: nil), router: InfoSongRouterImp(viewController: vc)))
                self.present(vc, animated: false, completion: nil)
            default:
                break
            }
        }
    }
}

enum ListScreen: Int {
    case InfoSong = 1
    case ListSongs = 2
}
enum TypeCell: Int {
    case CellLocal = 1
    case CellOnline = 2
}
