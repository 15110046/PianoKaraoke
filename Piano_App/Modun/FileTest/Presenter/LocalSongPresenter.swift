////
////  HomeControllerPresenter.swift
////  Piano_App
////
////  Created by Nguyen Hieu on 10/15/18.
////  Copyright © 2018 com.nguyenhieu.demo. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//protocol LocalSongPresenter {
//    func numberOfRows(_ tableView: UITableView ,inSection: Int) -> Int
//    func cellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    func didSelectRowAt(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath,viewController: UIViewController)
//    func heightForRowAt(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
//    func heightForFooterInSection(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
//}
//class LocalSongPresenterImp: LocalSongPresenter {
//    func heightForFooterInSection(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0
//    }
//    
//    func heightForRowAt(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return dataSongLocal[indexPath.row].heightCell
//    }
//    
//    func didSelectRowAt(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath,viewController: UIViewController) {
//        guard let viewControllerMain = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main") as? ViewController else { return }
//        viewControllerMain.config(nameSong: dataSongLocal[indexPath.row].nameSong)
//        
//        guard let navigationController = viewController.navigationController else {
//            viewController.present(viewControllerMain, animated: true, completion: nil)
//            return
//        }
//        navigationController.pushViewController(viewControllerMain, animated: true)
//        
//    }
//    
//        func cellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////            switch tableView {
////            case is TableViewListSong:
////                let cell = tableView.dequeueReusableCellWithType(type: HomeCell.self, forIndexPath: indexPath)
////                cell.config(nameSong: dataSongLocal[indexPath.row].nameSong, colorNameSong: dataSongLocal[indexPath.row].colorName, backgroundCellHome: dataSongLocal[indexPath.row].backgroundCell)
////                return cell
////            default:
////                return UITableViewCell()
////            }
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell else  {
//                return UITableViewCell()
//            }
//            cell.configUI(namesong: dataSongLocal[indexPath.row].nameSong)
//            return cell
//        }
//    
//
////    func cellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        switch tableView {
////        case is TableViewListSong:
////            let cell = tableView.dequeueReusableCellWithType(type: HomeCell.self, forIndexPath: indexPath)
////            cell.config(nameSong: dataSongLocal[indexPath.row].nameSong, colorNameSong: dataSongLocal[indexPath.row].colorName, backgroundCellHome: dataSongLocal[indexPath.row].backgroundCell)
////            return cell
////        default:
////            return UITableViewCell()
////        }
////    }
////
//    func numberOfRows(_ tableView: UITableView,inSection: Int) -> Int {
////        switch tableView {
////        case is TableViewCell:
////            return dataSongLocal.count
////        default:
////            return 0
////        }
//        return dataSongLocal.count
//    }
//    
//    let dataSongLocal: [SongKaraokeModel] = [SongKaraokeModel(nameSong: "Sứ Thanh Hoa", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Thần Thoại", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Nơi Tình Yêu Bắt Đầu", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Yêu Là Tha Thu", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Đồng Thoại", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Chờ Em Trong Đêm", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Kiếp Đỏ Đen", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Trăm Năm Không Quên", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Nữ Nhi Tình", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Chờ Người Nơi Ấy", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Em Gái Mưa", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Thành Phố Buồn", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Chắc Ai Đó Sẽ Về", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Ánh Trăng Nói Hộ Lòng Tôi", colorName: .black, backgroundCell: .white),
//                                             
//                                             SongKaraokeModel(nameSong: "Lạc Trôi", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Hong Kong 1", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Nếu Lúc Trước Em Đừng Tới", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Ảo Mộng Tình Yêu", colorName: .black, backgroundCell: .white),
//                                             SongKaraokeModel(nameSong: "Vén Rèm Châu", colorName: .black, backgroundCell: .white)
//    ]
//}
//
//
//
