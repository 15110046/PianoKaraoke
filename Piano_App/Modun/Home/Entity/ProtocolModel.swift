//
//  ProtocolModel.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/17/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit
protocol ModelHome {
    var viewController: UIViewController? { get }
    var heighthSize: CGFloat?             { get }
    var widthSize: CGFloat?               { get }
    var background : UIColor?             { get }
}
protocol ModelDetailCellSongs {
    var heighthSize: CGFloat?             { get }
    var widthSize: CGFloat?               { get }
    var background : UIColor?             { get }
    var viewController: UIViewController? { get }
}
