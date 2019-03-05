//
//  Level.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/3/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit

class Level: UIView {
    @IBOutlet private var contentView: UIView!
    private var numberStars: Int?
    
    
    @IBOutlet private weak var stars5: UIImageView!
    @IBOutlet private weak var stars4: UIImageView!
    @IBOutlet private weak var stars3: UIImageView!
    @IBOutlet private weak var stars2: UIImageView!
    @IBOutlet private weak var stars1: UIImageView!
    func config(numberStars: Int?) {
        self.numberStars = numberStars
        switch numberStars {
        case 1: stars2.image = UIImage(named: "starsExtra")
                stars3.image = UIImage(named: "starsExtra")
                stars4.image = UIImage(named: "starsExtra")
                stars5.image = UIImage(named: "starsExtra")
        case 2: stars3.image = UIImage(named: "starsExtra")
                stars4.image = UIImage(named: "starsExtra")
                stars5.image = UIImage(named: "starsExtra")
        case 3: stars5.image = UIImage(named: "starsExtra")
                stars4.image = UIImage(named: "starsExtra")
        case 4: stars5.image = UIImage(named: "starsExtra")
        case 5:     break
        default:    break
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        instanceFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func instanceFromNib(){
        Bundle.main.loadNibNamed("Level", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
