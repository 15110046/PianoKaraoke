//
//  ViewControllerTest.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 10/17/18.
//  Copyright © 2018 com.nguyenhieu.demo. All rights reserved.
//

import UIKit

class ViewControllerTest: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    @IBAction func action2(_ sender: UIButton, forEvent event: UIEvent) {
        guard let location = event.allTouches?.first?.location(in: sender) else {return}
        if sender.bounds.contains(location) {
            print("in2")
        }else {
            print("on2")
        }
    }
    @IBAction func action(_ sender: UIButton, forEvent
        event: UIEvent) {
            guard let location = event.allTouches?.first?.location(in: sender) else {return}
            if sender.bounds.contains(location) {
                print("in1")
            }else {
                print("on1")
            }
    }
    
    @IBAction func actionDragOutside(_ sender: Any) {
        print("aaa")
    }
    
    @IBAction func inside2(_ sender: UIButton, forEvent event: UIEvent) {
        
    }
    
    @IBAction func inside4(_ sender: UIButton, forEvent event: UIEvent) {
        guard let location = event.allTouches?.first?.location(in: sender) else {return}
        if sender.bounds.contains(location) {
            print("in1")
            sender.isHighlighted = true
        }else {
            sender.isHighlighted = false
            //sender.state = UIControl.State.normal
        }
    }
    
    
    @IBAction func inside3(_ sender: UIButton, forEvent event: UIEvent) {
        print("aa")
        
    }
    
    
    @IBAction func actionOutside(_ sender: Any) {
        print("aaa")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
