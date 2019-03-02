//
//  CollectionViewCellHome.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/12/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit
class NhacOnlineController: UICollectionViewCell {
    
    private var presenter: NhacOnlinePresenter?
    func inject(presenter: NhacOnlinePresenter) {
        self.presenter = presenter
        titleCellDanhChoNguoiMoiBatDau.text = presenter.getTitleForCell()
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        return presenter?.numberOfItemsInSection(section: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let dataCell = presenter?.dataForRowAt(indexPath: indexPath) ,
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellTopImageBottomTitle", for: indexPath) as? CellTopImageBottomTitle
            else { return UICollectionViewCell() }
        switch dataCell.title {
        case "Nhạc Việt":
            let dataNhacViet = dataCell.arrayNhacOnline[indexPath.row]
            cell.config(imageSong: dataNhacViet.imageSong, titleSong: dataNhacViet.nameSong)
        case "Nhạc Trung Quốc":
            cell.config(imageSong: dataCell.arrayNhacOnline[indexPath.row].imageSong, titleSong: dataCell.arrayNhacOnline[indexPath.row].nameSong)
        case "Dành cho người mới bắt đầu":
            cell.config(imageSong: dataCell.arrayNhacOnline[indexPath.row].imageSong, titleSong: dataCell.arrayNhacOnline[indexPath.row].nameSong)
        default: return UICollectionViewCell()
        }
        return cell
    }
    
}
extension NhacOnlineController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let height = presenter?.collectionViewLayoutHeightSize(sizeForItemAt: indexPath),
              let width = presenter?.collectionViewLayoutWitdhSize(sizeForItemAt: indexPath)
              else { return CGSize() }
        return CGSize(width: CGFloat.init(width), height: CGFloat.init(height))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.present(from: TypeCell.CellOnline, manHinh: ListScreen.InfoSong, indexPath: indexPath)
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

