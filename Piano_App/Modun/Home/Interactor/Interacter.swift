//
//  Interacter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/25/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol Interacter {
    var dataExtra: [ModelHome] { get }
    func getData(completionHandler: @escaping (_ data: [ModelHome]) -> ())
    func dataForRow(completion: @escaping (_ data: [ModelHome]) -> ())
    
}
class InteracterImp {
    var dataExtra: [ModelHome] {
        return data
    }
    private var uid: String?
    private var data: [ModelHome] = [SongsLocal(title: "Những bài hát Offline",
                                        arraySongs: [SongsLocalDetail(image: "su-thanh-hoa", nameSong: "Sứ Thanh Hoa", urlSong: "Cam Am Than Thoai C5"),
                                                     SongsLocalDetail(image: "ThanThoai", nameSong: "Thần Thoai", urlSong: "Cam Am Than Thoai C5")])
    ]
    init(uid: String?) {
        self.uid = uid
    }
    private func getDataCategory(param: String, completionHandler: @escaping (_ data: ModelHome) -> ()) {
        ServiceOnline.share.getData(param: param) { (snapShot) in
            //guard let self = self else { return }
            let data = snapShot as? NSDictionary
            let dataDanhChoNguoiMoi = NhacOnline(data: data as? [String : Any] ?? [:])
            
            //self.data.append(dataDanhChoNguoiMoi)
            DispatchQueue.main.async {
                completionHandler(dataDanhChoNguoiMoi)
            }
        }
    }
}
extension InteracterImp: Interacter {
    func dataForRow(completion: @escaping ([ModelHome]) -> ()) {
        completion(data)
    }
    
    func getData(completionHandler: @escaping ([ModelHome]) -> ()) {
        getDataCategory(param: "NhacTrungQuoc") { [weak self] (model) in
            guard let strongSelf = self else { return }
            strongSelf.data.append(model)
            completionHandler(strongSelf.data)
        }
        getDataCategory(param: "NhacViet") { [weak self] (model) in
            guard let strongSelf = self else { return }
            strongSelf.data.append(model)
            completionHandler(strongSelf.data)
        }
        getDataCategory(param: "DanhChoNguoiMoiBatDau") { [weak self] (model) in
            guard let strongSelf = self else { return }
            strongSelf.data.append(model)
            completionHandler(strongSelf.data)
        }
    }
}
