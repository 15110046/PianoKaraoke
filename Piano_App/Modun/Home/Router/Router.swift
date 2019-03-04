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
    func present(from screen: TypeCell, to manHinh: ListScreen, data: ModelDetailCellSongs)
}

extension HomeController: Router {

    func present(from cell: TypeCell, to manHinh: ListScreen, data: ModelDetailCellSongs) {
        switch cell {
        case TypeCell.CellLocal: 
            switch manHinh {
            case ListScreen.InfoSong:
                let vc = InfoSong()
                vc.inject(presnter: InfoSongPresenterImp.init(interacter: InfoSongInteracterImp.init(keyIdDetail: nil, dataLocal: data), router: InfoSongRouterImp(navtionController: self.navigationController)))
                self.navigationController?.pushViewController(vc, animated: true)
                self.navigationController?.isNavigationBarHidden = false
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
                vc.inject(presnter: InfoSongPresenterImp.init(interacter: InfoSongInteracterImp.init(keyIdDetail: keyIdDetailInfoSong.idDetail, dataLocal: nil), router: InfoSongRouterImp(navtionController: self.navigationController)))
                self.navigationController?.isNavigationBarHidden = false
                self.navigationController?.pushViewController(vc, animated: true)
            case ListScreen.ListSongs:
                let vc = ListSongs()
               
                vc.inject(presenter: ListSongsPresenterImp(interactor: ListSongsInteractorImp.init(key:"test"), router: ListSongsRouterImp.init(navtionController: self.navigationController)))
                self.navigationController?.pushViewController(vc, animated: true)
                self.navigationController?.isNavigationBarHidden = false
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
