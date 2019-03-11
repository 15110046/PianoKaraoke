//
//  NhacOnlineInteracter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/27/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol NhacOnlineInteracter {
    var data: NhacOnline { get }
}

class NhacOnlineInteracterImp: NhacOnlineInteracter {
    
    var data: NhacOnline
    
    init(data: ModelHome) {
        self.data = data as? NhacOnline ?? NhacOnline(data: [:])
    }
    
}
