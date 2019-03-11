//
//  Interacter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/25/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol Interacter {
    var data: [ModelHome] { get }
    func getData(collectionView: HomeControllerInterface)
}
class InteracterImp {
    
    var data: [ModelHome] = [SongsLocal(title: "Những bài hát Offline",
                                        arraySongs: [SongsLocalDetail(image: "ThanThoai", nameSong: "Sứ Thanh Hoa", urlSong: "Cam Am Than Thoai C5"),
                                                     SongsLocalDetail(image: "ThanThoai", nameSong: "Thần Thoai", urlSong: "Cam Am Than Thoai C5")])
    ]
    
    private func getDataCategory(collectionView: HomeControllerInterface, param: String) {
        ServiceOnline.share.getData(param: param) { [weak self] (snapShot) in
            guard let self = self else { return }
            let data = snapShot as? NSDictionary
            let dataDanhChoNguoiMoi = NhacOnline(data: data as? [String : Any] ?? [:])
            self.data.append(dataDanhChoNguoiMoi)
            DispatchQueue.main.async {
                collectionView.reloadDataCollectionView()
            }
        }
    }
}
extension InteracterImp: Interacter {
    func getData(collectionView: HomeControllerInterface) {
        getDataCategory(collectionView: collectionView, param: "NhacTrungQuoc")
        getDataCategory(collectionView: collectionView, param: "NhacViet")
        getDataCategory(collectionView: collectionView, param: "DanhChoNguoiMoiBatDau")
    }
}
