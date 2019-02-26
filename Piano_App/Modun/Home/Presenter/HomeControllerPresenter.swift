//
//  HomeControllerPresenter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/12/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit

protocol HomeControllerPresenter {
      func cellForItemAt(_ collectionView: UICollectionView, indexPath: IndexPath, viewController: UIViewController?) -> UICollectionViewCell 
    
    func numberOfItems(in section: Int) -> Int
    
    func collectionViewLayout(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    
    func viewDidload(_ collectionView: UICollectionView)
}
class HomeControllerPresenterImp: HomeControllerPresenter {
    var interacter: Interacter?
    
    func viewDidload(_ collectionView: UICollectionView){
        interacter = InteracterImp()
        interacter?.getDataFromFirebase(collectionView)
    }
    func numberOfItems(in section: Int) -> Int {
        return interacter?.data.count ?? 0
    }
    
    func cellForItemAt(_ collectionView: UICollectionView, indexPath: IndexPath, viewController: UIViewController?) -> UICollectionViewCell {
        let cell: CellSetting?
        switch interacter?.data[indexPath.row] {
        case _ as SongsLocal:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocalSongs", for: indexPath) as? CellSetting
        case _ as NhacOnline:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DanhChoNguoiMoiBatDau", for: indexPath) as? CellSetting
        default:
            return UICollectionViewCell()
        }
        cell?.getDataForCellCon(data: interacter?.data[indexPath.row] ?? NhacOnline(data: [:]), collectionView, sizeForItemAt: indexPath)
        cell?.setViewController(viewController: viewController ?? UIViewController())
        return cell as? UICollectionViewCell ?? UICollectionViewCell()
    }
    
     func collectionViewLayout(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch interacter?.data[indexPath.row] {
        case is SongsLocal:
            return CGSize(width:interacter?.data[indexPath.row].widthSize ?? 0, height: interacter?.data[indexPath.row].heighthSize ?? 0)
        case is NhacOnline:
            return CGSize(width: interacter?.data[indexPath.row].widthSize ?? 0, height: interacter?.data[indexPath.row].heighthSize ?? 0)
        default:
            return CGSize()
        }
    }
}
protocol CellSetting {
    func getDataForCellCon(data: ModelHome,_ collectionView: UICollectionView, sizeForItemAt indexPath: IndexPath)
   func setViewController(viewController: UIViewController)
}
