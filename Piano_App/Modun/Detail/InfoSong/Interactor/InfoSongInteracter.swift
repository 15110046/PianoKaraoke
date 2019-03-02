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
    var keyIdDetail: String? { get set }
    func getData(completion: @escaping (Result) -> ())
    var dataLocal: ModelDetailCellSongs? { get set}
}

class InfoSongInteracterImp: InfoSongInteracter {
    var dataLocal: ModelDetailCellSongs?
    
    func getData(completion: @escaping (Result) -> ())  {
        if keyIdDetail != nil {
            ServiceFirebase.share.ref.child("DetailSong").child(keyIdDetail ?? "").observe(.value) { (snapshot) in
                let data = snapshot.value as? NSDictionary
                let dataDetailInfoSong = DetailInfoSong(data: data as? [String : Any] ?? [:])
                completion(Result.succesWithCellOnline(value: dataDetailInfoSong))
            }
        }
        else {
            completion(Result.succesWithCellLocal(value: dataLocal))
        }
    }
    
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
enum Result {
    case succesWithCellLocal(value: ModelDetailCellSongs?)
    case succesWithCellOnline(value: DetailInfoSong?)
}
