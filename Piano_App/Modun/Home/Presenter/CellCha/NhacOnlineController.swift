//
//  CollectionViewCellHome.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/12/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit
class NhacOnlineController: UICollectionViewCell, CellSetting {
    func setViewController(viewController: UIViewController) {
        self.viewController = viewController
    }
    private var viewController: UIViewController?
    private var datasNhacOnline: NhacOnline?
    func getDataForCellCon(data: ModelHome, _ collectionView: UICollectionView, sizeForItemAt indexPath: IndexPath) {
        self.datasNhacOnline = data as? NhacOnline ?? NhacOnline(data: [:])
        titleCellDanhChoNguoiMoiBatDau.text = datasNhacOnline?.title
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
    private var titleCellDanhChoNguoiMoiBatDau: UILabel = {
        let txtTitle = UILabel()
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        txtTitle.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 18)
        return txtTitle
    }()
    private lazy var collectionViewDanhChoNguoiMoiBatDau: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let clsview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        clsview.translatesAutoresizingMaskIntoConstraints = false
        clsview.delegate = self
        clsview.dataSource = self
        layout.scrollDirection = .horizontal
        clsview.backgroundColor = .white
        clsview.register(CellTopImageBottomTitle.self, forCellWithReuseIdentifier: "CellTopImageBottomTitle")
        clsview.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        clsview.showsHorizontalScrollIndicator = false
        return clsview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .green
        autoLayoutViewHeader()
        autoLayoutTitleCellLocall()
        autoLayoutCollectionViewDanhChoNguoiBatDau()
    }
    private func autoLayoutCollectionViewDanhChoNguoiBatDau() {
        contentView.addSubview(collectionViewDanhChoNguoiMoiBatDau)
        collectionViewDanhChoNguoiMoiBatDau.topAnchor.constraint(equalTo: viewHeader.bottomAnchor, constant: 0).isActive = true
        collectionViewDanhChoNguoiMoiBatDau.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        collectionViewDanhChoNguoiMoiBatDau.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        collectionViewDanhChoNguoiMoiBatDau.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
    }
    private func autoLayoutViewHeader() {
        contentView.addSubview(viewHeader)
        viewHeader.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        viewHeader.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        viewHeader.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        viewHeader.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    private func autoLayoutTitleCellLocall() {
        viewHeader.addSubview(titleCellDanhChoNguoiMoiBatDau)
        titleCellDanhChoNguoiMoiBatDau.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor).isActive = true
        titleCellDanhChoNguoiMoiBatDau.leftAnchor.constraint(equalTo: viewHeader.leftAnchor, constant: 10).isActive = true
    }
}
extension NhacOnlineController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasNhacOnline?.arrayNhacOnline.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionViewDanhChoNguoiMoiBatDau.dequeueReusableCell(withReuseIdentifier: "CellTopImageBottomTitle", for: indexPath) as? CellTopImageBottomTitle else {
            return UICollectionViewCell()
        }
        switch datasNhacOnline?.title {
        case "Nhạc Việt":
            let dataNhacViet = datasNhacOnline?.arrayNhacOnline[indexPath.row] ?? ArrayNhacOnline(object: [:])
            cell.config(imageSong: dataNhacViet.imageSong, titleSong: dataNhacViet.nameSong)
        case "Nhạc Trung Quốc":
            let dataNhacTrungQuoc = datasNhacOnline?.arrayNhacOnline[indexPath.row] ?? ArrayNhacOnline(object: [:])
            cell.config(imageSong: dataNhacTrungQuoc.imageSong, titleSong: dataNhacTrungQuoc.nameSong)
        case "Dành cho người mới bắt đầu":
            let dataNhacDanhChoNguoiMoiBatDau = datasNhacOnline?.arrayNhacOnline[indexPath.row] ?? ArrayNhacOnline(object: [:])
            cell.config(imageSong: dataNhacDanhChoNguoiMoiBatDau.imageSong, titleSong: dataNhacDanhChoNguoiMoiBatDau.nameSong)
        default: break
        }
        return cell
    }
    
    
}
extension NhacOnlineController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch datasNhacOnline?.arrayNhacOnline[indexPath.row] {
        case is ArrayNhacOnline:
            return CGSize(width: (datasNhacOnline?.arrayNhacOnline[indexPath.row].widthSize ?? 0), height: (datasNhacOnline?.arrayNhacOnline[indexPath.row].heighthSize ?? 0))
        default:
            return CGSize()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch datasNhacOnline?.arrayNhacOnline[indexPath.row] {
        case is ArrayNhacOnline:
            let vcInfoSong = InfoSong()
            vcInfoSong.config(data: datasNhacOnline?.arrayNhacOnline[indexPath.row] ?? ArrayNhacOnline(object: [:]))
            viewController?.present(vcInfoSong, animated: true, completion: nil)
        default: break
        }
    }
}
extension NhacOnlineController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        
    }
}

