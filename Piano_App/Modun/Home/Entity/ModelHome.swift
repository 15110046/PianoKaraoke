//
//  ModelHome.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/12/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit

enum LayoutNhacTrungQuoc {
    case heightTQ
    case widthTQ
    case heightCellTQ
    case widthCellTQ
    var rawValue: CGFloat {
        switch self {
        case .heightTQ:
            return UIScreen.main.bounds.size.height/2
        case .widthTQ:
            return UIScreen.main.bounds.size.width
        case .heightCellTQ:
            return UIScreen.main.bounds.size.height/2 - 50
        case .widthCellTQ:
            return UIScreen.main.bounds.size.width/3
        }
    }
}
enum LayoutNhacViet {
    case heightNhacViet
    case widthNhacViet
    case heightCellNhacViet
    case widthCellNhacViet
    var rawValue: CGFloat {
        switch self {
        case .heightNhacViet:
            return UIScreen.main.bounds.size.height/3
        case .widthNhacViet:
            return UIScreen.main.bounds.size.width
        case .heightCellNhacViet:
            return UIScreen.main.bounds.size.height/3 - 50
        case .widthCellNhacViet:
            return UIScreen.main.bounds.size.width/4
        }
    }
}

enum LayoutDanhChoNguoiMoiBatDau {
    case heightDanhChoNguoiMoiBatDau
    case widthDanhChoNguoiMoiBatDau
    case heightCellDanhChoNguoiMoiBatDau
    case widthCellDanhChoNguoiMoiBatDau
    var rawValue: CGFloat {
        switch self {
        case .heightDanhChoNguoiMoiBatDau:
            return UIScreen.main.bounds.size.height/4
        case .widthDanhChoNguoiMoiBatDau:
            return UIScreen.main.bounds.size.width
        case .heightCellDanhChoNguoiMoiBatDau:
            return UIScreen.main.bounds.size.height/4 - 50
        case .widthCellDanhChoNguoiMoiBatDau:
            return UIScreen.main.bounds.size.width/3
        }
    }
}



struct BaiHatYeuThichNhat: ModelHome {
    var viewController: UIViewController? {
        return nil
    }
    
    var heighthSize: CGFloat? {
        return UIScreen.main.bounds.size.height / 3
    }
    
    var widthSize: CGFloat? {
        return UIScreen.main.bounds.size.width
    }
    
    var background: UIColor? {
        return .white
    }
    
    let arrayBaiHatYeuThichNhat: [ModelDetailCellSongs]
    let title: String?
    init(title: String, arrayBaiHatYeuThichNhat: [ModelDetailCellSongs]) {
        self.title = title
        self.arrayBaiHatYeuThichNhat = arrayBaiHatYeuThichNhat
    }
}
