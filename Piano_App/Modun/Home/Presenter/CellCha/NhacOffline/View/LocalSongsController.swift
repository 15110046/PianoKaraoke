//
//  CollectionViewCellHome.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/12/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit

class LocalSongsController: UICollectionViewCell {
    
    private var presenter: LocalSongsPresenter?
    func inject(presenter: LocalSongsPresenter) {
        self.presenter = presenter
        titleCellLocal.text = presenter.getTitleForCell()
    }
    
    private var viewHeader: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private var btnViewAll: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Xem tat ca", for: .normal)
        btn.backgroundColor = .red
        return btn
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        autoLayoutButton()
    }
    
    private func autoLayoutTitleCellLocall() {
        viewHeader.addSubview(titleCellLocal)
        titleCellLocal.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor).isActive = true
        titleCellLocal.leftAnchor.constraint(equalTo: viewHeader.leftAnchor, constant: 10).isActive = true
    }
    private func autoLayoutButton() {
        viewHeader.addSubview(btnViewAll)
        btnViewAll.topAnchor.constraint(equalTo: viewHeader.topAnchor, constant: 0).isActive = true
        btnViewAll.leftAnchor.constraint(equalTo: viewHeader.leftAnchor, constant: 0).isActive = true
        btnViewAll.rightAnchor.constraint(equalTo: viewHeader.rightAnchor, constant: 0).isActive = true
        btnViewAll.addTarget(self, action:#selector(self.clickViewAll), for: .touchUpInside)
    }
    
    @objc func clickViewAll() {
        print("a")
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
        return presenter?.numberOfItemsIn(section: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let dataCell = presenter?.dataForRowAt(indexPath: indexPath),
              let dataDetailCell = dataCell as? SongsLocalDetail,
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellConLocal", for: indexPath) as? CellConLocal
            else {
                return UICollectionViewCell()
            }
        cell.config(imageSong: dataDetailCell.getImageSong(), titleSong: dataDetailCell.getNameSong())
        return cell
    }
    
}
extension LocalSongsController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let height = presenter?.collectionViewLayoutHeightSize(sizeForItemAt: indexPath),
              let width = presenter?.collectionViewLayoutWitdhSize(sizeForItemAt: indexPath)
              else { return CGSize() }
        return CGSize(width: CGFloat(width), height: CGFloat(height))
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let dataCell = presenter?.dataForRowAt(indexPath: indexPath),
//            let dataDetailCell = dataCell as? SongsLocalDetail else { return }
        
        presenter?.present(manHinh: ListScreen.InfoSong, indexPath: indexPath)
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



