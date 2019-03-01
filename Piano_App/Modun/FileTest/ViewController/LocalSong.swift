////
////  HomeController.swift
////  Piano_App
////
////  Created by Nguyen Hieu on 10/15/18.
////  Copyright © 2018 com.nguyenhieu.demo. All rights reserved.
////
//
//import UIKit
//
//class LocalSong: UIViewController {
//    
//    @IBOutlet weak var tableViewListSong: TableViewListSong!
//    let gradientLayer:CAGradientLayer = CAGradientLayer()
//    var presenterHomController: LocalSongPresenter?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        presenterHomController = LocalSongPresenterImp()
//        tableViewListSong.registerNibForCellWithType(type: HomeCell.self)
//        
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        //       self.navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        //        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
//    
//}
//extension LocalSong: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch tableView {
//        case tableViewListSong:
//            return presenterHomController?.numberOfRows(tableViewListSong, inSection: section) ?? 0
//        default:
//            return 0
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch tableView {
//        case tableViewListSong:
//            return presenterHomController?.cellForRowAt(tableViewListSong, cellForRowAt: indexPath) ?? UITableViewCell()
//        default:
//            return UITableViewCell()
//        }
//    }
//    
//    
//}
//extension LocalSong: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return presenterHomController?.heightForFooterInSection(tableViewListSong, heightForFooterInSection: 0) ?? 0
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return presenterHomController?.heightForRowAt(tableViewListSong, heightForRowAt: indexPath) ?? 0
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch tableView {
//        case tableViewListSong:
//            
//            presenterHomController?.didSelectRowAt(tableViewListSong, didSelectRowAt: indexPath,viewController: self)
//        default:
//            break
//        }
//        //        self.navigationController?.isNavigationBarHidden = false
//    }
//}
//class UI_Util {
//    
//    static func setGradientGreenBlue(uiView: UIView) {
//        
//        let colorTop =  UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:0.85).cgColor
//        let colorBottom = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0).cgColor
//        
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [ colorTop, colorBottom,colorTop]
//        gradientLayer.locations = [ 0.0, 1.0]
//        gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: uiView.bounds.size.height)
//        uiView.layer.insertSublayer(gradientLayer, at: 0)
//    }
//    
//}
//extension UIView {
//    func addGradientBackground(firstColor: UIColor, secondColor: UIColor){
//        clipsToBounds = true
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
//        gradientLayer.frame = self.bounds
//        gradientLayer.frame.size.width = UIScreen.main.bounds.size.width
//        //            self.bounds
//        //CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 3*UIScreen.main.bounds.size.height / 10)
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
//        //        print(gradientLayer.frame)
//        self.layer.insertSublayer(gradientLayer, at: 0)
//    }
//}
//
