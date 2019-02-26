//
//  PianoViewController.swift
//  UpDownToneMp3
//
//  Created by Nguyen Hieu on 10/12/18.
//  Copyright © 2018 com.nguyenhieu.demo. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
class PianoViewController: UIViewController {
    private var audioName = ""
    private var audioPlayer = AVAudioPlayer()

    private var avPlayer: AVPlayer!
    private var player : AVPlayer?
    
    @IBOutlet weak var constrainsBottomSi4: NSLayoutConstraint!
    @IBOutlet private weak var viewMp4: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playMp4(toFile: "Cam Am Noi Nay Co Anh")
    }
    private func playMp4(toFile: String){
        let filepath: String? = Bundle.main.path(forResource: toFile, ofType: "mp4")
        let fileURL = URL.init(fileURLWithPath: filepath!)
        player = AVPlayer(url: fileURL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.viewMp4.bounds
        self.viewMp4.layer.addSublayer(playerLayer)
        player?.play()
    }
    private func playMp3(toFile: String){
        let url = URL(fileURLWithPath: Bundle.main.path(forResource:toFile, ofType: "mp3") ?? "")
        do {
            audioPlayer = try
                AVAudioPlayer(contentsOf: url )
            audioPlayer.prepareToPlay()
        } catch {
            return
        }
        audioPlayer.currentTime = 0
        audioPlayer.play()
    }
    //Quang 3
    @IBAction func btnB6(_ sender: Any) {
        playMp3(toFile: "B6")
    }
    @IBAction func btnAShap6(_ sender: Any) {
        playMp3(toFile: "A6Shap")
    }
    @IBAction func btnA6(_ sender: Any) {
        playMp3(toFile: "A6")
    }
    @IBAction func btnGShap6(_ sender: Any) {
        playMp3(toFile: "GShap6")
    }
    @IBAction func btnG6(_ sender: Any) {
        playMp3(toFile: "G6")
    }
    @IBAction func btnFShap6(_ sender: Any) {
        playMp3(toFile: "FShap6")
    }
    @IBAction func btnF6(_ sender: Any) {
        playMp3(toFile: "F6")
    }
    @IBAction func btnE6(_ sender: Any) {
        playMp3(toFile: "E6")
    }
    @IBAction func btnDShap6(_ sender: Any) {
        playMp3(toFile: "D6Shap")
    }
    @IBAction func btnD6(_ sender: Any) {
        playMp3(toFile: "D6")
    }
    @IBAction func btnCShap6(_ sender: Any) {
        playMp3(toFile: "C6Shap")
    }
    @IBAction func btnC6(_ sender: Any) {
        playMp3(toFile: "C6")
    }
    //Quang 2
    @IBAction func btnB5(_ sender: Any) {
        playMp3(toFile: "B5")
    }
    @IBAction func btnAShap5(_ sender: Any) {
        playMp3(toFile: "A5Shap")
    }
    @IBAction func btnA5(_ sender: Any) {
        playMp3(toFile: "A5")
    }
    @IBAction func btnGShap5(_ sender: Any) {
        playMp3(toFile: "G5Shap")
    }
    @IBAction func btnG5(_ sender: Any) {
        playMp3(toFile: "G5")
    }
    @IBAction func btnFShap5(_ sender: Any) {
        playMp3(toFile: "F5Shap")
    }
    @IBAction func btnF5(_ sender: Any) {
        playMp3(toFile: "F5")
    }
    @IBAction func btnE5(_ sender: Any) {
        playMp3(toFile: "E5")
    }
    @IBAction func btnDShap5(_ sender: Any) {
        playMp3(toFile: "D5Shap")
    }
    @IBAction func btnD5(_ sender: Any) {
        playMp3(toFile: "D5")
    }
    @IBAction func btnCShap5(_ sender: Any) {
        playMp3(toFile: "C5Shap")
    }
    @IBAction func btnC5(_ sender: Any) {
        playMp3(toFile: "C5")
    }
    //Quang 1
    @IBAction func btnB4(_ sender: Any) {
      
        playMp3(toFile: "B4")
    }
    @IBAction func btnAShap4(_ sender: Any) {
        playMp3(toFile: "A4Shap")
    }
    @IBAction func btnA4(_ sender: Any) {
        playMp3(toFile: "A4")
    }
    @IBAction func btnGShap4(_ sender: Any) {
        playMp3(toFile: "G4Shap")
    }
    @IBAction func btnG4(_ sender: Any) {
        playMp3(toFile: "G4")
    }
    @IBAction func btnFShap4(_ sender: Any) {
        playMp3(toFile: "F4Shap")
    }
    @IBAction func btnF4(_ sender: Any) {
        playMp3(toFile: "F4")
    }
    @IBAction func btnE4(_ sender: Any) {
        playMp3(toFile: "E4")
    }
    @IBAction func btnDShap4(_ sender: Any) {
        playMp3(toFile: "D4Shap")
    }
    @IBAction func btnD4(_ sender: Any) {
        playMp3(toFile: "D4")
    }
    @IBAction func btnCShap4(_ sender: Any) {
        playMp3(toFile: "C4Shap")
    }
    @IBAction func btnC4(_ sender: Any) {
        
        
        playMp3(toFile: "C4")
    }
    
    
    @IBAction func C5(_ sender: Any) {
        
        switch sender {
        case is UITapGestureRecognizer:
            print("tap")
        case let long as UILongPressGestureRecognizer:
            long.minimumPressDuration = 0.3
            print("long")
        case let swipe as UISwipeGestureRecognizer:
            switch swipe.direction {
            case .left:  print("left")
            case .right: print("right")
            case .up:    print("up")
            case .down:  print("down")
            default:
               break
            }
          
        default:
            print("la quac z")
        }
    }
    @IBAction func D5(_ sender: Any) {
        
        switch sender {
        case is UITapGestureRecognizer:
            print("tapD5")
        case let long as UILongPressGestureRecognizer:
            long.minimumPressDuration = 0.3
            print("longD5")
        case let swipe as UISwipeGestureRecognizer:
            switch swipe.direction {
            case .left:  print("leftD5")
            case .right: print("rightD5")
            case .up:    print("upD5")
            case .down:  print("downD5")
            default:
                break
            }
            
        default:
            print("la quac z")
        }
    }
}

