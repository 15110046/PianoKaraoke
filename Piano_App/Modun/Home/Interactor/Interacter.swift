//
//  Interacter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/25/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol SiderTableView {
}
struct InfoUserModel: SiderTableView {
    var name: String
    var avata : String
    init(data: [String: String]) {
        self.name = data["name"] ?? ""
        self.avata = data["avata"] ?? ""
    }
}
struct Logout: SiderTableView {
    var nameButton: String
    init(name: String) {
        self.nameButton = name
    }
}
protocol Interacter {
    var dataExtra: [ModelHome] { get }
    func getData(completionHandler: @escaping () -> ())
    func dataForRow(completion: @escaping (_ data: [ModelHome]) -> ())
    var dataUserExtra: [SiderTableView] { get }
    func getInfoUserFormServiceOnline(completion: @escaping () -> ())
}
class InteracterImp {
    var dataExtra: [ModelHome] {
        return data
    }
    var dataUserExtra: [SiderTableView] {
        return dataUser
    }
    private var uid: String?
    private var dataUser: [SiderTableView] = []
    private var data: [ModelHome] = [SongsLocal(title: "Những bài hát Offline",
                                                arraySongs: [SongsLocalDetail(image: "su-thanh-hoa", nameSong: "Sứ Thanh Hoa", urlSong: "Cam Am Than Thoai C5"),
                                                             SongsLocalDetail(image: "ThanThoai", nameSong: "Thần Thoai", urlSong: "Cam Am Than Thoai C5")])
    ]
    init(uid: String?) {
        self.uid = uid
    }
    private func getDataCategory(param: String, completionHandler: @escaping (_ data: ModelHome) -> ()) {
        ServiceOnline.share.getData(param: param) { (snapShot) in
            let data = snapShot as? NSDictionary
            let dataDanhChoNguoiMoi = NhacOnline(data: data as? [String : Any] ?? [:])

            DispatchQueue.main.async {
                completionHandler(dataDanhChoNguoiMoi)
            }
        }
    }
}
extension InteracterImp: Interacter {
    func getInfoUserFormServiceOnline(completion: @escaping () -> ()) {
        dataUser.removeAll()
        ServiceOnline.share.getDataUser(uid: uid ?? "") { [weak self] (data) in
            guard let strongSelf = self,
                let data = data as? [String: String] else { return }
            strongSelf.dataUser.append(InfoUserModel(data: data))
            strongSelf.dataUser.append(Logout(name: "Đăng xuất"))
            completion()
        }
    }
    func dataForRow(completion: @escaping ([ModelHome]) -> ()) {
        completion(data)
    }
    
    func getData(completionHandler: @escaping () -> ()) {
//        var dataImp = [ModelHome]()
//
//        getDataCategory(param: "DanhChoNguoiMoiBatDau") { [weak self] (model) in
//            guard let strongSelf = self else { return }
//            dataImp.append(model)
//
//            strongSelf.getDataCategory(param: "NhacTrungQuoc") { [weak self] (model) in
//                guard let strongSelf = self else { return }
//                dataImp.append(model)
//
//                strongSelf.getDataCategory(param: "NhacViet") {  [weak self] (model) in
//                    guard let strongSelf = self else { return }
//                    dataImp.append(model)
//
//                    strongSelf.data = strongSelf.data + dataImp
//                    completionHandler()
//                }
//            }
//        }
        getDataCategory(param: "DanhChoNguoiMoiBatDau") { [weak self] (model) in
            guard let strongSelf = self else { return }
            strongSelf.data.append(model)
            //          completionHandler()
            
            strongSelf.getDataCategory(param: "NhacTrungQuoc") { [weak self] (model) in
                guard let strongSelf = self else { return }
                strongSelf.data.append(model)
                //                 completionHandler()
                //                dataImp.append(model)
                //                strongSelf.data = strongSelf.data + dataImp
                //                completionHandler()
                
                strongSelf.getDataCategory(param: "NhacViet") {  [weak self] (model) in
                    guard let strongSelf = self else { return }
                    //                    dataImp.append(model)
                    //                    //                    groupGetData.leave()
                    //                    strongSelf.data = strongSelf.data + dataImp
                    strongSelf.data.append(model)
                    completionHandler()
                }
            }
        }
        
    }
}
