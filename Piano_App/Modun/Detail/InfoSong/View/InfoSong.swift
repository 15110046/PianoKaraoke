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
    private var presenter: InfoSongPresenter?
    
    func inject(presnter: InfoSongPresenter) {
        self.presenter = presnter
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let testData = presenter?.getData()
        print(testData)
    }
}
