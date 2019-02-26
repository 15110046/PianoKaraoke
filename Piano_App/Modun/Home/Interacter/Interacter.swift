//
//  Interacter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/25/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit
protocol Interacter {
    var data: [ModelHome] { get set }
    func getDataFromFirebase(_ collectionView: UICollectionView) 
}
class InteracterImp: Interacter {
    
    
    
    var data: [ModelHome] = [SongsLocal(title: "Những bài hát Offline",
                                        arraySongs: [SongsLocalDetail(image: "ThanThoai", nameSong: "Sứ Thanh Hoa"),
                                                     SongsLocalDetail(image: "ThanThoai", nameSong: "Thần Thoai")])
    ]
    func getDataFromFirebase(_ collectionView: UICollectionView) {
        getDataCategoryNhacViet(collectionView: collectionView)
        getDataCategoryNhacTrungQuoc(collectionView: collectionView)
        getDataCategoryDanhChoNguoiMoiBatDau(collectionView: collectionView)
    }
    private func getDataCategoryNhacViet(collectionView: UICollectionView) {
        ServiceFirebase.share.ref.child("OverViewCategoryApp").child("NhacTrungQuoc").observe(.value) { (snapshot) in
            let data = snapshot.value as? NSDictionary
            let dataDanhChoNguoiMoi = NhacOnline(data: data as? [String : Any] ?? [:])
            self.data.append(dataDanhChoNguoiMoi)
            collectionView.reloadData()
        }
    }
    
    private func getDataCategoryNhacTrungQuoc(collectionView: UICollectionView) {
        ServiceFirebase.share.ref.child("OverViewCategoryApp").child("NhacViet").observe(.value) { (snapshot) in
            let data = snapshot.value as? NSDictionary
            let dataDanhChoNguoiMoi = NhacOnline(data: data as? [String : Any] ?? [:])
            self.data.append(dataDanhChoNguoiMoi)
            collectionView.reloadData()
        }
    }
    private func getDataCategoryDanhChoNguoiMoiBatDau(collectionView: UICollectionView) {
        ServiceFirebase.share.ref.child("OverViewCategoryApp").child("DanhChoNguoiMoiBatDau").observe(.value) { (snapshot) in
            let data = snapshot.value as? NSDictionary
            let dataDanhChoNguoiMoi = NhacOnline(data: data as? [String : Any] ?? [:])
            self.data.append(dataDanhChoNguoiMoi)
            collectionView.reloadData()
            //            print(self.dataHome)
        }
    }
}
