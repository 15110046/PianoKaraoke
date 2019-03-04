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
                                        arraySongs: [SongsLocalDetail(image: "ThanThoai", nameSong: "Sứ Thanh Hoa", urlSong: "Cam Am Than Thoai C5"),
                                                     SongsLocalDetail(image: "ThanThoai", nameSong: "Thần Thoai", urlSong: "Cam Am Than Thoai C5")])
    ]
    
    func getData(collectionView: CollectionHomeViewController) {
        getDataCategoryNhacViet(collectionView: collectionView)
        getDataCategoryNhacTrungQuoc(collectionView: collectionView)
        getDataCategoryDanhChoNguoiMoiBatDau(collectionView: collectionView)
    }
    private func getDataCategoryNhacViet(collectionView: CollectionHomeViewController) {
        ServiceFirebase.share.ref.child("OverViewCategoryApp").child("NhacTrungQuoc").observeSingleEvent(of: .value, with: { [weak self] (snapshot) in
            guard let self = self else { return }
            let data = snapshot.value as? NSDictionary
            let dataDanhChoNguoiMoi = NhacOnline(data: data as? [String : Any] ?? [:])
            self.data.append(dataDanhChoNguoiMoi)
            DispatchQueue.main.async {
                collectionView.reloadDataCollectionView()
            }
        })
        
        
            
        
    }
    
    private func getDataCategoryNhacTrungQuoc(collectionView: CollectionHomeViewController) {
         ServiceFirebase.share.ref.child("OverViewCategoryApp").child("NhacViet").observeSingleEvent(of: .value, with: { [weak self] (snapshot) in
            guard let self = self else { return }
            let data = snapshot.value as? NSDictionary
            let dataDanhChoNguoiMoi = NhacOnline(data: data as? [String : Any] ?? [:])
            self.data.append(dataDanhChoNguoiMoi)
            DispatchQueue.main.async {
                collectionView.reloadDataCollectionView()
            }
        })
    }
    private func getDataCategoryDanhChoNguoiMoiBatDau(collectionView: CollectionHomeViewController){
        ServiceFirebase.share.ref.child("OverViewCategoryApp").child("DanhChoNguoiMoiBatDau").observeSingleEvent(of: .value, with: { [weak self] (snapshot) in
            guard let self = self else { return }
            let data = snapshot.value as? NSDictionary
            let dataDanhChoNguoiMoi = NhacOnline(data: data as? [String : Any] ?? [:])
            self.data.append(dataDanhChoNguoiMoi)
            DispatchQueue.main.async {
                collectionView.reloadDataCollectionView()
            }
        })
    }
}
