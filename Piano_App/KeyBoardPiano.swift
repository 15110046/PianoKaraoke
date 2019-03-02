//
//  KeyBoardPiano.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/2/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

import UIKit

class KeyBoardPiano: UIView {
    @IBOutlet weak var viewName: UIView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "KeyBoardPiano", bundle: nil).instantiate(withOwner: self, options: nil)
    }
}
