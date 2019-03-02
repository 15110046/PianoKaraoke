//
//  LocalSongsInteractor.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/27/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol LocalSongsInteractor {
    var data: SongsLocal { get set }
}

class LocalSongsInteractorIml: LocalSongsInteractor {
    init(data: ModelHome) {
         self.data = data as? SongsLocal ?? SongsLocal(title: "", arraySongs: [])
    }
    var data: SongsLocal
}
