//
//  HomeController.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/12/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit



class HomeController: UIViewController {
    //presenter
    var presenter: HomeControllerPresenter?
    // bien
    private var viewHeader: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private var titleHeader1: UILabel = {
        let txtTitle = UILabel()
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        txtTitle.text = "Play"
        txtTitle.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        return txtTitle
    }()
    private var titleHeader2: UILabel = {
        let txtTitle = UILabel()
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        txtTitle.text = "Songs with Piano KeyBoard"
        txtTitle.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        txtTitle.textColor = .red
        return txtTitle
    }()
    private lazy var collectionViewHome: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let clsview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        clsview.translatesAutoresizingMaskIntoConstraints = false
        clsview.delegate = self
        clsview.dataSource = self
        layout.scrollDirection = .vertical
        clsview.backgroundColor = .white
        clsview.register(LocalSongsController.self, forCellWithReuseIdentifier: "LocalSongs")
//        clsview.register(NhacVietController.self, forCellWithReuseIdentifier: "NhacViet")
        clsview.register(NhacOnlineController.self, forCellWithReuseIdentifier: "DanhChoNguoiMoiBatDau")
//        clsview.register(NhacTrungQuocController.self, forCellWithReuseIdentifier: "NhacTrungQuoc")
//        clsview.register(TopBaiHatDuocYeuThichNhatController.self, forCellWithReuseIdentifier: "TopBaiHatYeuThichNhat")
        clsview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return clsview
    }()
    //auto layout
    private func autoLayoutViewHeader() {
        view.addSubview(viewHeader)
        viewHeader.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: 0).isActive = true
        viewHeader.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        viewHeader.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        viewHeader.heightAnchor.constraint(equalToConstant: 100).isActive = true
        autoLayoutTitleHeader1()
        autoLayoutTitleHeader2()
    }
    private func autoLayoutTitleHeader1() {
        viewHeader.addSubview(titleHeader1)
        titleHeader1.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor, constant: 20).isActive = true
        titleHeader1.leftAnchor.constraint(equalTo: viewHeader.leftAnchor, constant: 20).isActive = true
    }
    private func autoLayoutTitleHeader2() {
        viewHeader.addSubview(titleHeader2)
        titleHeader2.topAnchor.constraint(equalTo: titleHeader1.topAnchor, constant: 0).isActive = true
        titleHeader2.leftAnchor.constraint(equalTo: titleHeader1.rightAnchor, constant: 5).isActive = true
    }
    private func autoLayoutCollectionViewHome() {
        view.addSubview(collectionViewHome)
        collectionViewHome.topAnchor.constraint(equalTo: viewHeader.bottomAnchor, constant: 0).isActive = true
        collectionViewHome.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        collectionViewHome.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        collectionViewHome.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        autoLayoutViewHeader()
        autoLayoutCollectionViewHome()
        presenter = HomeControllerPresenterImp()
        presenter?.viewDidload(collectionViewHome)
        
    }
}
extension HomeController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter?.collectionViewLayout(collectionViewHome, layout: collectionViewLayout, sizeForItemAt: indexPath) ?? CGSize()
    }
    
}
extension HomeController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfItems(in: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return presenter?.cellForItemAt(collectionViewHome, indexPath: indexPath, viewController: self) ?? UICollectionViewCell()
    }
    
    
}
extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
}


extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}