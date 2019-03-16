//
//  ListSongs.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/4/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import UIKit

class ListSongs: UIViewController {
    private var presenter: ListSongsPresenter?
    func inject(presenter: ListSongsPresenter?) {
        self.presenter = presenter
    }
    fileprivate var arrHeightImage = [CGFloat]()
    private lazy var collectionViewListSongs: UICollectionView = {
        let layout = CustomLayoutColectionView.init()
        let cls = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.delegate = self
        cls.translatesAutoresizingMaskIntoConstraints = false
        cls.dataSource = self
        cls.delegate = self
        cls.register(ListSongsCell.self, forCellWithReuseIdentifier: "ListSongsCell")
        cls.backgroundColor = UIColor.hexStringToUIColor(hex: "17182C", alpha: 1)
        return cls
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        autoLayoutClsView()
    }
    func config(title navigationTitle: String) {
        navigationItem.title = navigationTitle
    }
    private func autoLayoutClsView() {
        view.addSubview(collectionViewListSongs)
        collectionViewListSongs.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionViewListSongs.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        collectionViewListSongs.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        collectionViewListSongs.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    }
}
extension ListSongs: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfItem() ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = presenter?.getData(),
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListSongsCell", for: indexPath)
            as? ListSongsCell
            else { return UICollectionViewCell() }
        cell.config(nameSong: data[indexPath.row].nameSong, nameImageSong: data[indexPath.row].imageSong) { [weak self](height) in
            guard let self = self else { return }
            self.arrHeightImage.append(height)
        }
        return cell
    }
}
extension ListSongs: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let data = presenter?.getData() else { return }
        presenter?.present(keyIdDetail: data[indexPath.item].idDetail)
    }
}
extension ListSongs: UICollectionViewDelegateFlowLayout {}

extension ListSongs: CustomLayoutColectionViewDelegate {
    func numberItem() -> Int {
        return presenter?.numberOfItem() ?? 0
    }
    
    func collectionViewWitdhSize() -> Float {
        return Float(GetFramUIScreen.share.getWitdhUIScreen()/2 - 15)
    }
    
    func collectionViewHeightSize(sizeForItemAt indexPath: IndexPath) -> Float {
        return 0
    }
    
    func heightForText(atIndexPath indexPath: IndexPath) -> CGFloat {
        guard let data = presenter?.getData() else { return 0 }
        return data[indexPath.item].nameSong.height(constraintedWidth: collectionViewListSongs.bounds.size.width/2 - 15, font: UIFont(name: "AmericanTypewriter", size: 18) ?? UIFont())
    }
    
    func heightForImage(atIndexPath indexPath: IndexPath) -> CGFloat {
        print(arrHeightImage)
        return arrHeightImage[indexPath.item]
    }
}

extension ListSongs: HomeControllerInterface {
    func reloadDataCollectionView() {
        collectionViewListSongs.reloadData()
    }
}
