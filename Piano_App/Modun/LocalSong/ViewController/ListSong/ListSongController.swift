//
//  ListSongController.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/5/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import UIKit

class ListSongController: UIViewController {
    var presenterHomController: LocalSongPresenter?
    private var titleListSong: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    private lazy var tableViewListSong: UITableView = {
        let tbv = UITableView()
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.delegate = self
        tbv.dataSource = self
        tbv.estimatedRowHeight = 100
        tbv.rowHeight = UITableView.automaticDimension
        tbv.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tbv.separatorColor = .white
        return tbv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayoutViewTitle()
        autoLayoutTableView()
        presenterHomController = LocalSongPresenterImp()
       
    }
    private func autoLayoutTableView() {
        view.addSubview(tableViewListSong)
        tableViewListSong.topAnchor.constraint(equalTo: titleListSong.bottomAnchor, constant: 0).isActive = true
        tableViewListSong.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableViewListSong.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableViewListSong.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    private func setUpLayoutViewTitle() {
        view.addSubview(titleListSong)
        titleListSong.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: 0).isActive = true
        titleListSong.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        titleListSong.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        titleListSong.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
extension ListSongController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenterHomController?.numberOfRows(tableViewListSong, inSection: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenterHomController?.cellForRowAt(tableViewListSong, cellForRowAt: indexPath) ?? UITableViewCell()
    }
}
extension ListSongController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return presenterHomController?.heightForFooterInSection(tableViewListSong, heightForFooterInSection: 0) ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenterHomController?.heightForRowAt(tableViewListSong, heightForRowAt: indexPath) ?? 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            presenterHomController?.didSelectRowAt(tableViewListSong, didSelectRowAt: indexPath,viewController: self)
    }
}
