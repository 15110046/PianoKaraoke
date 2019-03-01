////
////  HomeCell.swift
////  Piano_App
////
////  Created by Nguyen Hieu on 10/15/18.
////  Copyright © 2018 com.nguyenhieu.demo. All rights reserved.
////
//
//import UIKit
//
//class HomeCell: UITableViewCell {
//
//    @IBOutlet weak var backgroundCellHome: UIView!
//    @IBOutlet weak var lblSongKaraoke: UILabel!
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        let firstColor = UIColor.hexStringToUIColor(hex: "ff0000", alpha: 1)
//        let secondColor = UIColor.hexStringToUIColor(hex: "ffff66", alpha: 1)
//        backgroundCellHome.addGradientBackground(firstColor: secondColor, secondColor: firstColor)
//    }
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
//    
//    
//    func config(nameSong: String, colorNameSong: UIColor,backgroundCellHome: UIColor){
//        self.lblSongKaraoke.text = nameSong
//        self.lblSongKaraoke.textColor = colorNameSong
////        self.backgroundCellHome.backgroundColor = backgroundCellHome
//    }
//
//}
