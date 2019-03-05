//
//  ListSongsInteractor.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/4/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol ListSongsInteractor {
    var keyRoot: String? { get set }
    var dataListSongs: [ModelListSongs]? { get set}

}
class ListSongsInteractorImp: ListSongsInteractor {

    var dataListSongs: [ModelListSongs]?
   
    var keyRoot: String?
    
    init(key: String?,clsView: CollectionHomeViewController) {
        self.keyRoot = key
        UseCaseFirebase.getData(key: keyRoot ?? "") { [weak self] (arrayDataListSongs) in
            guard let strongSelf = self else { return }
            strongSelf.dataListSongs = arrayDataListSongs
            DispatchQueue.main.async {
                clsView.reloadDataCollectionView()
            }
        }
    }
    
    
}