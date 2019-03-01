//
//  Interacter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/25/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol Interacter {
    var data: [ModelHome] { get set }
    func getData(collectionView: CollectionHomeViewController)
}
class InteracterImp: Interacter {
 
    var data: [ModelHome] = [SongsLocal(title: "Những bài hát Offline",
                                        arraySongs: [SongsLocalDetail(image: "ThanThoai", nameSong: "Sứ Thanh Hoa"),
                                                     SongsLocalDetail(image: "ThanThoai", nameSong: "Thần Thoai")])
    ]
    func getData(collectionView: CollectionHomeViewController) {
        getDataCategoryNhacViet(collectionView: collectionView)
        getDataCategoryNhacTrungQuoc(collectionView: collectionView)
        getDataCategoryDanhChoNguoiMoiBatDau(collectionView: collectionView)
    }
    private func getDataCategoryNhacViet(collectionView: CollectionHomeViewController) {
        ServiceFirebase.share.ref.child("OverViewCategoryApp").child("NhacTrungQuoc").observe(.value) { (snapshot) in
            let data = snapshot.value as? NSDictionary
            let dataDanhChoNguoiMoi = NhacOnline(data: data as? [String : Any] ?? [:])
            self.data.append(dataDanhChoNguoiMoi)
            collectionView.reloadDataCollectionView()
        }
    }
    
    private func getDataCategoryNhacTrungQuoc(collectionView: CollectionHomeViewController) {
        ServiceFirebase.share.ref.child("OverViewCategoryApp").child("NhacViet").observe(.value) { (snapshot) in
            let data = snapshot.value as? NSDictionary
            let dataDanhChoNguoiMoi = NhacOnline(data: data as? [String : Any] ?? [:])
            self.data.append(dataDanhChoNguoiMoi)
            collectionView.reloadDataCollectionView()
        }
    }
    private func getDataCategoryDanhChoNguoiMoiBatDau(collectionView: CollectionHomeViewController){
        ServiceFirebase.share.ref.child("OverViewCategoryApp").child("DanhChoNguoiMoiBatDau").observe(.value) { (snapshot) in
            let data = snapshot.value as? NSDictionary
            let dataDanhChoNguoiMoi = NhacOnline(data: data as? [String : Any] ?? [:])
            self.data.append(dataDanhChoNguoiMoi)
            collectionView.reloadDataCollectionView()
        }
    }
}
