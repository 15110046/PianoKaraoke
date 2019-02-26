//
//  InfoSong.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/18/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit

class InfoSong: UIViewController {
    private var dataInfoSong: ModelDetailCellSongs?
    func config(data: ModelDetailCellSongs) {
        self.dataInfoSong = data
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print(dataInfoSong)
        // Do any additional setup after loading the view.
    }
}
