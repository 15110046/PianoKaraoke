//
//  ServiceFirebase.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/14/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class ServiceFirebase {
    static var share = ServiceFirebase()
    var ref = Database.database().reference()
}
