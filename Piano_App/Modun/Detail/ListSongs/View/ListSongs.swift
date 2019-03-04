//
//  ListSongs.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/4/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import UIKit

class ListSongs: UIViewController {
    private var presenter: ListSongsPresenter?
    func inject(presenter: ListSongsPresenter?) {
        self.presenter = presenter
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
