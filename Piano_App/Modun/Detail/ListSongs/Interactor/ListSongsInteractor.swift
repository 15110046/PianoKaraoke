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
}
class ListSongsInteractorImp: ListSongsInteractor {
    var keyRoot: String?
    
    init(key: String?) {
        self.keyRoot = key
    }
    
}
