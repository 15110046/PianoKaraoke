//
//  ServiceLoginInteractor.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/19/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
protocol ServiceLoginInteractor {
    var uID: String { get }
}
class ServiceLoginInteractorImp {
    private var uid: String?
//    UserDefaults.standard.value(forKeyPath: "UID") as? String ?? "12313"
    init(uid: String?) {
        self.uid = uid
    }
}
extension ServiceLoginInteractorImp: ServiceLoginInteractor {
    var uID: String {
        return uid ?? ""
    }
    
    
}
