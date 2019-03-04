//
//  ViewController.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 10/13/18.
//  Copyright © 2018 com.nguyenhieu.demo. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    private var linkMp4: String?
    private var nameSong: String?
    private var typeCellInitViewController: TypeCell?
    func config(link: String?, nameSong: String?, typeCellInitViewController: TypeCell?) {
        self.linkMp4 = link
        self.nameSong = nameSong
        self.typeCellInitViewController = typeCellInitViewController
    }
    
    
    private let playerViewController = AVPlayerViewController()
    
    private func playvideo(localOrOnline: TypeCell ,link: String) {
        switch localOrOnline {
        case .CellLocal:
            let filepath: String? = Bundle.main.path(forResource: link, ofType: "mp4")
            let fileURL = URL.init(fileURLWithPath: filepath ?? "")
            player = AVPlayer(url: fileURL)
        case .CellOnline:
            if let videoURL = URL(string: link) {
                player = AVPlayer(url: videoURL)
            }
        }
        playerViewController.player = player
        playerViewController.view.frame = CGRect(x: 0, y: 0, width: viewMp4.bounds.size.width , height: viewMp4.bounds.size.height)
        self.viewMp4.addSubview(playerViewController.viewIfLoaded ?? UIView())
    }

    @IBOutlet private weak var C4: KeyButton!
    @IBOutlet private weak var C4Shap: KeyButton!
    @IBOutlet private weak var D4: KeyButton!
    @IBOutlet private weak var D4Shap: KeyButton!
    @IBOutlet private weak var E4: KeyButton!
    @IBOutlet private weak var F4: KeyButton!
    @IBOutlet private weak var F4Shap: KeyButton!
    @IBOutlet private weak var G4: KeyButton!
    @IBOutlet private weak var B4: KeyButton!
    @IBOutlet private weak var A4Shap: KeyButton!
    @IBOutlet private weak var A4: KeyButton!
    @IBOutlet private weak var G4Shap: KeyButton!
    
    @IBOutlet private weak var C5: KeyButton!
    @IBOutlet private weak var C5Shap: KeyButton!
    @IBOutlet private weak var D5: KeyButton!
    @IBOutlet private weak var D5Shap: KeyButton!
    @IBOutlet private weak var E5: KeyButton!
    @IBOutlet private weak var F5: KeyButton!
    @IBOutlet private weak var F5Shap: KeyButton!
    @IBOutlet private weak var G5: KeyButton!
    @IBOutlet private weak var B5: KeyButton!
    @IBOutlet private weak var A5Shap: KeyButton!
    @IBOutlet private weak var A5: KeyButton!
    @IBOutlet private weak var G5Shap: KeyButton!
    
    @IBOutlet private weak var C6: KeyButton!
    @IBOutlet private weak var C6Shap: KeyButton!
    @IBOutlet private weak var D6: KeyButton!
    @IBOutlet private weak var D6Shap: KeyButton!
    @IBOutlet private weak var E6: KeyButton!
    @IBOutlet private weak var F6: KeyButton!
    @IBOutlet private weak var F6Shap: KeyButton!
    @IBOutlet private weak var G6: KeyButton!
    @IBOutlet private weak var B6: KeyButton!
    @IBOutlet private weak var A6Shap: KeyButton!
    @IBOutlet private weak var A6: KeyButton!
    @IBOutlet private weak var G6Shap: KeyButton!
    
    
    
    //    @IBAction func action(_ sender: KeyButton, forEvent event: UIEvent) {
    //       guard let location = event.allTouches?.first?.location(in: sender) else {return}
    //       if sender.bounds.contains(location) {
    //        print("in")
    //        }else {
    //        print("on")
    //        }
    //    }
    @IBOutlet private weak var viewMp4: UIView!
    
    @IBOutlet private weak var viewPiano2: UIView!
    
    @IBOutlet private weak var viewPiano3: UIView!
    
    @IBOutlet private weak var viewPiano1: UIView!
    
    private var player : AVPlayer?
    private let pianoSounds = PianoSounds()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backItem?.title = nil
        navigationItem.title = nameSong
        let dataUI = [C4, C4Shap, D4, D4Shap, E4, F4, F4Shap, G4, G4Shap, A4, A4Shap, B4,
                      C5, C5Shap, D5, D5Shap, E5, F5, F5Shap, G5, G5Shap, A5, A5Shap, B5,
                      C6, C6Shap, D6, D6Shap, E6, F6, F6Shap, G6, G4Shap, A6, A6Shap, B6 ]
        for keyButton in dataUI {
            keyButton?.delegate = self
        }
        playvideo(localOrOnline: typeCellInitViewController ?? TypeCell.CellLocal, link: linkMp4 ?? "")
        let edgePanGes = self.navigationController?.view.gestureRecognizers?.first
        let edgePanges = self.navigationController?.view.gestureRecognizers?.last
        edgePanGes?.isEnabled = false
        edgePanges?.isEnabled = false
        
        viewPiano1.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -800, 0, 0)
        UIView.animate(withDuration: 3) {
            self.viewPiano1.layer.transform = CATransform3DIdentity
        }
        viewPiano2.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 800, 0, 0)
        UIView.animate(withDuration: 3) {
            self.viewPiano2.layer.transform = CATransform3DIdentity
        }
        viewPiano3.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -800, 0, 0)
        UIView.animate(withDuration: 3) {
            self.viewPiano3.layer.transform = CATransform3DIdentity
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParent {
            player?.pause()
            player = nil
        }
    }
}

extension ViewController: KeyButtonDelegate {
    func swipeTouch(keyButtonStart: KeyButton, keyButtonEnd: UIButton) {
        
    }
    func endedTouch(keyButton: KeyButton) {
        switch keyButton {
        case C4:     pianoSounds.keyUp(tangent: .C4)
        case C4Shap: pianoSounds.keyUp(tangent: .C4Shap)
        case D4:     pianoSounds.keyUp(tangent: .D4)
        case D4Shap: pianoSounds.keyUp(tangent: .D4Shap)
        case E4:     pianoSounds.keyUp(tangent: .E4)
        case F4:     pianoSounds.keyUp(tangent: .F4)
        case F4Shap: pianoSounds.keyUp(tangent: .F4Shap)
        case G4:     pianoSounds.keyUp(tangent: .G4)
        case G4Shap: pianoSounds.keyUp(tangent: .G4Shap)
        case A4:     pianoSounds.keyUp(tangent: .A4)
        case A4Shap: pianoSounds.keyUp(tangent: .A4Shap)
        case B4:     pianoSounds.keyUp(tangent: .B4)
            
        case C5:     pianoSounds.keyUp(tangent: .C5)
        case C5Shap: pianoSounds.keyUp(tangent: .C5Shap)
        case D5:     pianoSounds.keyUp(tangent: .D5)
        case D5Shap: pianoSounds.keyUp(tangent: .D5Shap)
        case E5:     pianoSounds.keyUp(tangent: .E5)
        case F5:     pianoSounds.keyUp(tangent: .F5)
        case F5Shap: pianoSounds.keyUp(tangent: .F5Shap)
        case G5:     pianoSounds.keyUp(tangent: .G5)
        case G5Shap: pianoSounds.keyUp(tangent: .G5Shap)
        case A5:     pianoSounds.keyUp(tangent: .A5)
        case A5Shap: pianoSounds.keyUp(tangent: .A5Shap)
        case B5:     pianoSounds.keyUp(tangent: .B5)
            
        case C6:     pianoSounds.keyUp(tangent: .C6)
        case C6Shap: pianoSounds.keyUp(tangent: .C6Shap)
        case D6:     pianoSounds.keyUp(tangent: .D6)
        case D6Shap: pianoSounds.keyUp(tangent: .D6Shap)
        case E6:     pianoSounds.keyUp(tangent: .E6)
        case F6:     pianoSounds.keyUp(tangent: .F6)
        case F6Shap: pianoSounds.keyUp(tangent: .F6Shap)
        case G6:     pianoSounds.keyUp(tangent: .G6)
        case G6Shap: pianoSounds.keyUp(tangent: .G6Shap)
        case A6:     pianoSounds.keyUp(tangent: .A6)
        case A6Shap: pianoSounds.keyUp(tangent: .A6Shap)
        case B6:     pianoSounds.keyUp(tangent: .B6)
        default: break
        }
    }
    
    func beganTouch(keyButton: KeyButton) {
        switch keyButton {
        case C4:     pianoSounds.keyDown(tangent: .C4)
        case C4Shap: pianoSounds.keyDown(tangent: .C4Shap)
        case D4:     pianoSounds.keyDown(tangent: .D4)
        case D4Shap: pianoSounds.keyDown(tangent: .D4Shap)
        case E4:     pianoSounds.keyDown(tangent: .E4)
        case F4:     pianoSounds.keyDown(tangent: .F4)
        case F4Shap: pianoSounds.keyDown(tangent: .F4Shap)
        case G4:     pianoSounds.keyDown(tangent: .G4)
        case G4Shap: pianoSounds.keyDown(tangent: .G4Shap)
        case A4:     pianoSounds.keyDown(tangent: .A4)
        case A4Shap: pianoSounds.keyDown(tangent: .A4Shap)
        case B4:     pianoSounds.keyDown(tangent: .B4)
            
        case C5:     pianoSounds.keyDown(tangent: .C5)
        case C5Shap: pianoSounds.keyDown(tangent: .C5Shap)
        case D5:     pianoSounds.keyDown(tangent: .D5)
        case D5Shap: pianoSounds.keyDown(tangent: .D5Shap)
        case E5:     pianoSounds.keyDown(tangent: .E5)
        case F5:     pianoSounds.keyDown(tangent: .F5)
        case F5Shap: pianoSounds.keyDown(tangent: .F5Shap)
        case G5:     pianoSounds.keyDown(tangent: .G5)
        case G5Shap: pianoSounds.keyDown(tangent: .G5Shap)
        case A5:     pianoSounds.keyDown(tangent: .A5)
        case A5Shap: pianoSounds.keyDown(tangent: .A5Shap)
        case B5:     pianoSounds.keyDown(tangent: .B5)
            
        case C6:     pianoSounds.keyDown(tangent: .C6)
        case C6Shap: pianoSounds.keyDown(tangent: .C6Shap)
        case D6:     pianoSounds.keyDown(tangent: .D6)
        case D6Shap: pianoSounds.keyDown(tangent: .D6Shap)
        case E6:     pianoSounds.keyDown(tangent: .E6)
        case F6:     pianoSounds.keyDown(tangent: .F6)
        case F6Shap: pianoSounds.keyDown(tangent: .F6Shap)
        case G6:     pianoSounds.keyDown(tangent: .G6)
        case G6Shap: pianoSounds.keyDown(tangent: .G6Shap)
        case A6:     pianoSounds.keyDown(tangent: .A6)
        case A6Shap: pianoSounds.keyDown(tangent: .A6Shap)
        case B6:     pianoSounds.keyDown(tangent: .B6)
        default: break
        }
    }
    
    //    func endedTouch(keyButton: KeyButton) {
    //        switch keyButton {
    //        case C4: pianoSounds.keyUp(tangent: .C4)
    //        case C4Shap: pianoSounds.keyUp(tangent: .C4Shap)
    //        case D4: pianoSounds.keyUp(tangent: .D4)
    //        case D4Shap: pianoSounds.keyUp(tangent: .D4Shap)
    //        case E4: pianoSounds.keyUp(tangent: .E4)
    //        case F4: pianoSounds.keyUp(tangent: .F4)
    //        case F4Shap: pianoSounds.keyUp(tangent: .F4Shap)
    //        case G4: pianoSounds.keyUp(tangent: .G4)
    //        case G4Shap: pianoSounds.keyUp(tangent: .G4Shap)
    //        case A4: pianoSounds.keyUp(tangent: .A4)
    //        case A4Shap: pianoSounds.keyUp(tangent: .A4Shap)
    //        case B4: pianoSounds.keyUp(tangent: .B4)
    //
    //        case C5: pianoSounds.keyUp(tangent: .C5)
    //        case C5Shap: pianoSounds.keyUp(tangent: .C5Shap)
    //        case D5: pianoSounds.keyUp(tangent: .D5)
    //        case D5Shap: pianoSounds.keyUp(tangent: .D5Shap)
    //        case E5: pianoSounds.keyUp(tangent: .E5)
    //        case F5: pianoSounds.keyUp(tangent: .F5)
    //        case F5Shap: pianoSounds.keyUp(tangent: .F5Shap)
    //        case G5: pianoSounds.keyUp(tangent: .G5)
    //        case G5Shap: pianoSounds.keyUp(tangent: .G5Shap)
    //        case A5: pianoSounds.keyUp(tangent: .A5)
    //        case A5Shap: pianoSounds.keyUp(tangent: .A5Shap)
    //        case B5: pianoSounds.keyUp(tangent: .B5)
    //
    //        case C6: pianoSounds.keyUp(tangent: .C6)
    //        case C6Shap: pianoSounds.keyUp(tangent: .C6Shap)
    //        case D6: pianoSounds.keyUp(tangent: .D6)
    //        case D6Shap: pianoSounds.keyUp(tangent: .D6Shap)
    //        case E6: pianoSounds.keyUp(tangent: .E6)
    //        case F6: pianoSounds.keyUp(tangent: .F6)
    //        case F6Shap: pianoSounds.keyUp(tangent: .F6Shap)
    //        case G6: pianoSounds.keyUp(tangent: .G6)
    //        case G6Shap: pianoSounds.keyUp(tangent: .G6Shap)
    //        case A6: pianoSounds.keyUp(tangent: .A6)
    //        case A6Shap: pianoSounds.keyUp(tangent: .A6Shap)
    //        case B6: pianoSounds.keyUp(tangent: .B6)
    //        default: break
    //        }
    //    }
}

extension UIViewController {
    func hideNavigationBar(){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    func showNavigationBar() {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

//
//
//switch nameSong {
//case "Thành Phố Buồn":
//    viewPiano1.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, -200, 0)
//    UIView.animate(withDuration: 3) {
//        self.viewPiano1.layer.transform = CATransform3DIdentity
//    }
//    viewPiano2.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, -400, 0)
//    UIView.animate(withDuration: 4) {
//        self.viewPiano2.layer.transform = CATransform3DIdentity
//    }
//    viewPiano3.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, -600, 0)
//    UIView.animate(withDuration: 5) {
//        self.viewPiano3.layer.transform = CATransform3DIdentity
//    }
//case "Sứ Thanh Hoa":
//    viewPiano1.layer.transform = CATransform3DScale(CATransform3DIdentity, 3, 3, 0)
//    UIView.animate(withDuration: 2) {
//        self.viewPiano1.layer.transform = CATransform3DIdentity
//
//    }
//    viewPiano2.layer.transform = CATransform3DScale(CATransform3DIdentity, 0, 0, 0)
//    UIView.animate(withDuration: 3) {
//
//        self.viewPiano2.layer.transform = CATransform3DIdentity
//
//    }
//    viewPiano3.layer.transform = CATransform3DScale(CATransform3DIdentity, 3, 3, 0)
//    UIView.animate(withDuration: 2) {
//
//        self.viewPiano3.layer.transform = CATransform3DIdentity
//
//    }
//case "Đồng Thoại":
//    viewPiano1.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 200, -200, 0)
//    UIView.animate(withDuration: 3) {
//        self.viewPiano1.layer.transform = CATransform3DIdentity
//    }
//    viewPiano2.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -800, 0, 0)
//    UIView.animate(withDuration: 3) {
//        self.viewPiano2.layer.transform = CATransform3DIdentity
//    }
//    viewPiano3.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 1000,  1000, 0)
//    UIView.animate(withDuration: 3) {
//        self.viewPiano3.layer.transform = CATransform3DIdentity
//    }
//case "Chờ Người Nơi Ấy":
//    let radians = CGFloat(1800)
//    viewPiano1.layer.transform = CATransform3DMakeRotation(radians, 0.0, 0.0, 1.0)
//    UIView.animate(withDuration: 1) {
//        self.viewPiano1.layer.transform = CATransform3DIdentity
//    }
//    viewPiano2.layer.transform = CATransform3DMakeRotation(radians, 1.0, 1.0, 1.0)
//    UIView.animate(withDuration: 2) {
//        self.viewPiano2.layer.transform = CATransform3DIdentity
//    }
//    viewPiano3.layer.transform = CATransform3DMakeRotation(radians, 0.0, 0.0, 1.0)
//    UIView.animate(withDuration: 3) {
//        self.viewPiano3.layer.transform = CATransform3DIdentity
//    }
//
//default:
//    viewPiano1.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -800, 0, 0)
//    UIView.animate(withDuration: 3) {
//        self.viewPiano1.layer.transform = CATransform3DIdentity
//    }
//    viewPiano2.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 800, 0, 0)
//    UIView.animate(withDuration: 3) {
//        self.viewPiano2.layer.transform = CATransform3DIdentity
//    }
//    viewPiano3.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -800, 0, 0)
//    UIView.animate(withDuration: 3) {
//        self.viewPiano3.layer.transform = CATransform3DIdentity
//    }
//}
