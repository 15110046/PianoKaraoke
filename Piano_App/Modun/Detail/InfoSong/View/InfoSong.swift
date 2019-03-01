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
        autoLayoutbtnPiano()
    }
    private var buttonPiano: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("click", for: .normal)
        btn.backgroundColor = .red
        return btn
    }()
    func autoLayoutbtnPiano() {
        view.addSubview(buttonPiano)
        buttonPiano.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        buttonPiano.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        
        buttonPiano.addTarget(self, action:#selector(self.click), for: .touchUpInside)
    }
    @objc func click() {
        presenter?.present()
    }
}
