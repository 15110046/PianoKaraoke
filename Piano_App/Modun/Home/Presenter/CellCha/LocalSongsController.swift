//
//  CollectionViewCellHome.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/12/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit
class LocalSongsController: UICollectionViewCell, CellSetting {
    func setViewController(viewController: UIViewController) {
        self.viewController = viewController
    }
    private var viewController: UIViewController?
    
    private var datasLocalSong: SongsLocal?
    
    func getDataForCellCon(data: ModelHome, _ collectionView: UICollectionView, sizeForItemAt indexPath: IndexPath) {
        self.datasLocalSong = data as? SongsLocal ?? SongsLocal(title: "", arraySongs: [])
        titleCellLocal.text = datasLocalSong?.title
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private var viewHeader: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private var titleCellLocal: UILabel = {
        let txtTitle = UILabel()
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        txtTitle.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 18)
        return txtTitle
    }()
    private lazy var collectionViewBaiHatOffline: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let clsview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        clsview.translatesAutoresizingMaskIntoConstraints = false
        clsview.delegate = self
        clsview.dataSource = self
        layout.scrollDirection = .horizontal
        clsview.backgroundColor = .white
        clsview.register(CellConLocal.self, forCellWithReuseIdentifier: "CellConLocal")
        clsview.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        clsview.showsHorizontalScrollIndicator = false
        return clsview
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        autoLayoutViewHeader()
        autoLayoutTitleCellLocall()
        autoLayoutColectionViewBaiHatOffline()
    }
    private func autoLayoutViewHeader() {
        contentView.addSubview(viewHeader)
        viewHeader.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        viewHeader.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        viewHeader.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        viewHeader.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    private func autoLayoutTitleCellLocall() {
        viewHeader.addSubview(titleCellLocal)
        titleCellLocal.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor).isActive = true
        titleCellLocal.leftAnchor.constraint(equalTo: viewHeader.leftAnchor, constant: 10).isActive = true
    }
    private func autoLayoutColectionViewBaiHatOffline() {
        contentView.addSubview(collectionViewBaiHatOffline)
        collectionViewBaiHatOffline.topAnchor.constraint(equalTo: viewHeader.bottomAnchor, constant: 0).isActive = true
        collectionViewBaiHatOffline.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        collectionViewBaiHatOffline.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        collectionViewBaiHatOffline.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
}
extension LocalSongsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasLocalSong?.arraySongs.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionViewBaiHatOffline.dequeueReusableCell(withReuseIdentifier: "CellConLocal", for: indexPath) as? CellConLocal else {
            return UICollectionViewCell()
        }
        switch datasLocalSong?.arraySongs[indexPath.row] {
        case let dataDetail as SongsLocalDetail:
            cell.config(imageSong: dataDetail.getImageSong(), titleSong: dataDetail.getNameSong())
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
}
extension LocalSongsController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch datasLocalSong?.arraySongs[indexPath.row] {
        case is SongsLocalDetail:
            return CGSize(width: (datasLocalSong?.arraySongs[indexPath.row].widthSize ?? 0), height: (datasLocalSong?.arraySongs[indexPath.row].heighthSize ?? 0))
        default:
            return CGSize()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch datasLocalSong?.arraySongs[indexPath.row] {
        case is SongsLocalDetail:
            let vcInfoSong = InfoSong()
            vcInfoSong.config(data: datasLocalSong?.arraySongs[indexPath.row] ?? SongsLocalDetail(image: "", nameSong: ""))
            viewController?.present(vcInfoSong, animated: true, completion: nil)
         default: break
        }
    }
}
extension LocalSongsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        
    }
}

