//
//  PianoController.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/1/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer
import AVKit
class PianoController: UIViewController {
    var moviePlayer: MPMoviePlayerController!
//    private var viewKeyBoard: KeyBoardPiano = {
//        let nsCoder = NSCoder.init()
//        guard let view = KeyBoardPiano(coder: nsCoder) else { return UIView() as! KeyBoardPiano }
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        playvideo()
        view.backgroundColor = .red
//        autoLayoutKeyboard()
    }
//    func autoLayoutKeyboard() {
//        view.addSubview(viewKeyBoard)
//        viewKeyBoard.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//        viewKeyBoard.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        viewKeyBoard.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        viewKeyBoard.heightAnchor.constraint(equalToConstant: 200).isActive = true
//    }
    let playerViewController = AVPlayerViewController()
    func playvideo() {
        if let videoURL = URL(string: "https://firebasestorage.googleapis.com/v0/b/pianoapp-48598.appspot.com/o/videos%2FEm%20Ga%CC%81i%20Mu%CC%9Ba.mp4?alt=media&token=6fc061a1-a23e-4c00-bd9d-767992a5b3a2") {
            let player = AVPlayer(url: videoURL)
            
            playerViewController.player = player
            
            playerViewController.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/3)
            self.view.addSubview(playerViewController.view)
            
        }
    }
}
