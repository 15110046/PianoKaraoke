//
//  Router.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/25/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import UIKit

protocol Router {
    func present(from screen: TypeCell, to manHinh: ListScreen, data: ModelDetailCellSongs, dataOnline: NhacOnline?)
    func presentSearchViewController()
}

extension HomeController: Router {
    func presentSearchViewController() {
        let searchViewController = SearchViewController()
        let interactor = SearchInteractorImp()
        let navigation = UINavigationController(rootViewController: searchViewController)
        navigation.setUpUINaviationItem()
        let router = SearchRouterImp(navigationController: navigation,viewController: searchViewController)
        searchViewController.inject(presenter: SearchPresenterImp(interactor: interactor, router: router))
        self.present(navigation, animated: false, completion: nil)
        navigation.navigationBar.isHidden = true
    }
    func present(from cell: TypeCell, to manHinh: ListScreen, data: ModelDetailCellSongs, dataOnline: NhacOnline?) {
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
               
                vc.inject(presenter: ListSongsPresenterImp(interactor: ListSongsInteractorImp.init(key: dataOnline?.key, clsView: vc), router: ListSongsRouterImp.init(navtionController: self.navigationController)))
                vc.config(title: dataOnline?.category.rawValue ?? "")
                self.navigationController?.pushViewController(vc, animated: false)
                self.navigationController?.isNavigationBarHidden = false
            }
        }
    }
}

