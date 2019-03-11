//
//  InfoSongInteracter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/28/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol InfoSongInteracter {
    //var dataInfoSong: ModelDetailCellSongs? { get set }
    var keyIdDetail: String? { get }
    func getData(completion: @escaping (Result) -> ())
    var dataLocal: ModelDetailCellSongs? { get }
}

class InfoSongInteracterImp {
    var dataLocal: ModelDetailCellSongs?
    var keyIdDetail: String?
    
    
    init(keyIdDetail: String?, dataLocal: ModelDetailCellSongs?) {
        if keyIdDetail != nil {
            self.keyIdDetail = keyIdDetail
            self.dataLocal = nil
        }
        else {
            self.keyIdDetail = nil
            self.dataLocal = dataLocal
        }
    }
}
extension InfoSongInteracterImp: InfoSongInteracter {
    func getData(completion: @escaping (Result) -> ())  {
        if keyIdDetail != nil {
            ServiceOnline.share.getDataInfoSong(param: keyIdDetail ?? "") { (snapShot) in
                let data = snapShot as? NSDictionary
                let dataDetailInfoSOng = DetailInfoSong(data: data as? [String : Any] ?? [:])
                completion(Result.succesWithCellOnline(value: dataDetailInfoSOng))
            }
        }
        else {
            completion(Result.succesWithCellLocal(value: dataLocal))
        }
    }
    
}

enum Result {
    case succesWithCellLocal(value: ModelDetailCellSongs?)
    case succesWithCellOnline(value: DetailInfoSong?)
}
