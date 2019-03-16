//
//  CollectionViewCellHome.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/12/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit
class NhacOnlineCell: UICollectionViewCell {
    
    private var presenter: NhacOnlinePresenter?
    
    func inject(presenter: NhacOnlinePresenter) {
        self.presenter = presenter
        titleCellDanhChoNguoiMoiBatDau.text = presenter.getTitleForCell()
        if titleCellDanhChoNguoiMoiBatDau.text == "Dành cho người mới bắt đầu" {
            btnViewAll.isHidden = true
        }
        else {
            btnViewAll.isHidden = false
        }
    }
    
    private var viewHeader: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.hexStringToUIColor(hex: ColorLayout.backgroundCell.rawValue, alpha: 1)
        return view
    }()
    private var btnViewAll: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Xem tất cả", for: .normal)
        btn.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 15)
        btn.titleLabel?.textColor = .white
        return btn
    }()
    
    private var titleCellDanhChoNguoiMoiBatDau: UILabel = {
        let txtTitle = UILabel()
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        txtTitle.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 18)
        txtTitle.textColor = .white
        return txtTitle
    }()
    
    fileprivate lazy var collectionViewDanhChoNguoiMoiBatDau: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let clsview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        clsview.translatesAutoresizingMaskIntoConstraints = false
        clsview.delegate = self
        clsview.dataSource = self
        layout.scrollDirection = .horizontal
        clsview.backgroundColor = UIColor.hexStringToUIColor(hex: ColorLayout.backgroundCell.rawValue, alpha: 1)
        clsview.register(CellTopImageBottomTitle.self, forCellWithReuseIdentifier: "CellTopImageBottomTitle")
        clsview.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        clsview.showsHorizontalScrollIndicator = false
        return clsview
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .green
        autoLayoutViewHeader()
        autoLayoutCollectionViewDanhChoNguoiBatDau()
        
    }
    
    
    func configure() {
        collectionViewDanhChoNguoiMoiBatDau.reloadData()
    }
    
    private func autoLayoutbtnViewAll() {
        viewHeader.addSubview(btnViewAll)
        btnViewAll.bottomAnchor.constraint(equalTo: titleCellDanhChoNguoiMoiBatDau.bottomAnchor, constant: 0).isActive = true
        btnViewAll.rightAnchor.constraint(equalTo: viewHeader.rightAnchor, constant: -5).isActive = true
        btnViewAll.addTarget(self, action:#selector(self.clickViewAll), for: .touchUpInside)
    }
    @objc func clickViewAll() {
        btnViewAll.flash()
        presenter?.present(from: TypeCell.CellOnline, manHinh: ListScreen.ListSongs, indexPath: nil)
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
        autoLayoutTitleCellLocall()
        autoLayoutbtnViewAll()
    }
    
    private func autoLayoutTitleCellLocall() {
        viewHeader.addSubview(titleCellDanhChoNguoiMoiBatDau)
        titleCellDanhChoNguoiMoiBatDau.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor).isActive = true
        titleCellDanhChoNguoiMoiBatDau.leftAnchor.constraint(equalTo: viewHeader.leftAnchor, constant: 10).isActive = true
    }
    
}

extension NhacOnlineCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfItemsInSection(section: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let dataCell = presenter?.dataForRowAt(indexPath: indexPath),
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellTopImageBottomTitle", for: indexPath) as? CellTopImageBottomTitle
            else { return UICollectionViewCell() }
        //        switch dataCell.category {
        //        case .newbiew:
        //            cell.config(imageSong: dataCell.arrayNhacOnline[indexPath.item].imageSong, titleSong: dataCell.arrayNhacOnline[indexPath.item].nameSong)
        //        case .chinaSong:
        //            cell.config(imageSong: dataCell.arrayNhacOnline[indexPath.item].imageSong, titleSong: dataCell.arrayNhacOnline[indexPath.item].nameSong)
        //        case .vietnameseSong:
        //            cell.config(imageSong: dataCell.arrayNhacOnline[indexPath.item].imageSong, titleSong: dataCell.arrayNhacOnline[indexPath.item].nameSong)
        //        case .unknown:
        //            return UICollectionViewCell()
        //        }
//        switch dataCell[indexPath.item].category {
//        case .newbiew:
//            cell.config(imageSong: dataCell[indexPath.row].arrayNhacOnline[indexPath.item].imageSong, titleSong: dataCell[indexPath.row].arrayNhacOnline[indexPath.item].nameSong)
//        case .chinaSong:
//            cell.config(imageSong: dataCell[indexPath.row].arrayNhacOnline[indexPath.item].imageSong, titleSong: dataCell[indexPath.row].arrayNhacOnline[indexPath.item].nameSong)
//        case .vietnameseSong:
//            cell.config(imageSong: dataCell[indexPath.row].arrayNhacOnline[indexPath.item].imageSong, titleSong: dataCell[indexPath.row].arrayNhacOnline[indexPath.item].nameSong)
//        case .unknown:
//            return UICollectionViewCell()
//        }
        cell.config(imageSong: dataCell.arrayNhacOnline[indexPath.item].imageSong, titleSong: dataCell.arrayNhacOnline[indexPath.item].nameSong)
        return cell
    }
    
}
extension NhacOnlineCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let height = presenter?.collectionViewLayoutHeightSize(sizeForItemAt: indexPath),
            let width = presenter?.collectionViewLayoutWitdhSize(sizeForItemAt: indexPath)
            else { return CGSize() }
        return CGSize(width: CGFloat(width), height: CGFloat(height))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.present(from: TypeCell.CellOnline, manHinh: ListScreen.InfoSong, indexPath: indexPath)
    }
    
}
extension NhacOnlineCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


protocol NhacOnlineCellInterface {
    func realoadCollectionView()
}
extension NhacOnlineCell: NhacOnlineCellInterface {
    func realoadCollectionView() {
        self.collectionViewDanhChoNguoiMoiBatDau.reloadData()
    }
}
