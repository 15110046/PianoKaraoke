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
    private var presenter: HomeControllerPresenter?
    // bien
    private var viewHeader: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.hexStringToUIColor(hex: "17182C", alpha: 1)
        return view
    }()
    private var titleHeader1: UILabel = {
        let txtTitle = UILabel()
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        txtTitle.text = "Hát Karaoke với"
        txtTitle.textColor = UIColor.hexStringToUIColor(hex: "D48A5E", alpha: 1)
        txtTitle.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        return txtTitle
    }()
    private var titleHeader2: UILabel = {
        let txtTitle = UILabel()
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        txtTitle.text = "bàn phím Piano"
        txtTitle.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        txtTitle.textColor = UIColor.hexStringToUIColor(hex: "D48A5E", alpha: 1)
        return txtTitle
    }()
    private lazy var collectionViewHome: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let clsview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        clsview.translatesAutoresizingMaskIntoConstraints = false
        clsview.delegate = self
        clsview.dataSource = self
        layout.scrollDirection = .vertical
        clsview.backgroundColor = UIColor.hexStringToUIColor(hex: "17182C", alpha: 1)
        clsview.register(LocalSongsController.self, forCellWithReuseIdentifier: "LocalSongs")
        clsview.register(NhacOnlineController.self, forCellWithReuseIdentifier: "OnlineSongs")
        clsview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return clsview
    }()
    //auto layout
    private func autoLayoutViewHeader() {
        view.addSubview(viewHeader)
        viewHeader.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        viewHeader.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        viewHeader.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        viewHeader.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height/10).isActive = true
        autoLayoutTitleHeader1()
        autoLayoutTitleHeader2()
    }
    private func autoLayoutTitleHeader1() {
        viewHeader.addSubview(titleHeader1)
        titleHeader1.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor, constant: 0).isActive = true
        titleHeader1.leftAnchor.constraint(equalTo: viewHeader.leftAnchor, constant: 10).isActive = true
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
        view.backgroundColor = .white
        autoLayoutCollectionViewHome()
        presenter = HomeControllerPresenterImp()
        presenter?.viewDidload(self, router: self)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
//    override func viewDidAppear(_ animated: Bool) {
//        self.navigationController?.isNavigationBarHidden = true
//               collectionViewHome.reloadData()
//    }
}
extension HomeController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = presenter?.collectionViewLayoutWidth(self, sizeForItemAt: indexPath)
        let height = presenter?.collectionViewLayoutHeight(self, sizeForItemAt: indexPath)
        return CGSize(width: CGFloat(width ?? 0), height: CGFloat(height ?? 0))
    }
}
extension HomeController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfItems(in: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let dataCell = presenter?.dataForRowAt(indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        switch dataCell {
        case is SongsLocal:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocalSongs", for: indexPath) as? LocalSongsController else { return UICollectionViewCell() }
            let interactor = LocalSongsInteractorIml(data: dataCell)
            let presenter = LocalSongsPresenterIml(interactor: interactor, router: self)
            cell.inject(presenter: presenter)
            return cell
        case is NhacOnline:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnlineSongs", for: indexPath) as? NhacOnlineController else {
                return UICollectionViewCell()
            }
            let interactor = NhacOnlineInteracterImp(data: dataCell)
            cell.inject(presenter: NhacOnlinePresenterImp(interacter: interactor, router: self))
            return cell
        default:
             return UICollectionViewCell()
        }
    }
}
extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
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

protocol CollectionHomeViewController {
    func reloadDataCollectionView()
}
extension HomeController: CollectionHomeViewController {
    func reloadDataCollectionView() {
        collectionViewHome.reloadData()
    }
}
