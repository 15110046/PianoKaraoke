//
//  HomeController.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/12/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import UIKit

protocol HomeControllerInterface {
    func reloadDataCollectionView()
}
class HomeController: UIViewController {
    //presenter
    private var presenter: HomeControllerPresenter?
    // bien
    private var btnSearch: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
//    private lazy var tblSearch: UITableView = {
//        let tbl = UITableView()
//        tbl.delegate = self
//        tbl.dataSource = self
//        tbl.translatesAutoresizingMaskIntoConstraints = false
//        return tbl
//    }()
    private var viewHeader: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.hexStringToUIColor(hex: ColorLayout.backgroundTitle.rawValue, alpha: 1)
        return view
    }()
    private var titleHeader1: UILabel = {
        let txtTitle = UILabel()
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        txtTitle.text = "Hát Karaoke với"
        txtTitle.textColor = UIColor.hexStringToUIColor(hex: ColorLayout.title.rawValue, alpha: 1)
        txtTitle.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        return txtTitle
    }()
    private var titleHeader2: UILabel = {
        let txtTitle = UILabel()
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        txtTitle.text = "bàn phím Piano"
        txtTitle.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        txtTitle.textColor = UIColor.hexStringToUIColor(hex: ColorLayout.title.rawValue, alpha: 1)
        return txtTitle
    }()
    private lazy var collectionViewHome: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let clsview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        clsview.translatesAutoresizingMaskIntoConstraints = false
        clsview.delegate = self
        clsview.dataSource = self
        layout.scrollDirection = .vertical
        clsview.backgroundColor = UIColor.hexStringToUIColor(hex: ColorLayout.backgroundHome.rawValue, alpha: 1)
        clsview.register(LocalSongsController.self, forCellWithReuseIdentifier: "LocalSongs")
        clsview.register(NhacOnlineCell.self, forCellWithReuseIdentifier: "OnlineSongs")
        clsview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return clsview
    }()
    //auto layout
//    private func autoLayoutTblSearch() {
//        view.addSubview(tblSearch)
//        tblSearch.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
//        tblSearch.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        tblSearch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        tblSearch.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//        tblSearch.isHidden = true
//    }
    private func autoLayoutBtnSearch() {
        viewHeader.addSubview(btnSearch)
        
        btnSearch.bottomAnchor.constraint(equalTo: titleHeader1.bottomAnchor, constant: 0).isActive = true
        btnSearch.rightAnchor.constraint(equalTo: viewHeader.rightAnchor, constant: -10).isActive = true
        btnSearch.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        btnSearch.widthAnchor.constraint(equalTo: btnSearch.heightAnchor, multiplier: 1).isActive = true
        btnSearch.setBackgroundImage(UIImage.init(named: "search-icon"), for: .normal)
        btnSearch.addTarget(self, action: (#selector(HomeController.clickSearchBar)), for: .touchDown)
    }
    @objc private func clickSearchBar() {
//        let vc = SearchViewController()
//        self.present(vc, animated: false, completion: nil)
        self.presenter?.presentSearchViewController()
    }
//    private func createSearchBar(placeholder: String, delegate: UISearchBarDelegate) -> UISearchController {
//        let searchController = UISearchController(searchResultsController: nil)
//        searchController.searchBar.delegate = delegate
//        searchController.searchBar.placeholder = placeholder
//        searchController.searchBar.showsCancelButton = true
//        searchController.searchBar.changeBackgroundUISearchBar()
////        searchController.searchBar.barTintColor = UIColor.hexStringToUIColor(hex: "123456", alpha: 1)
//        return searchController
//    }
    private func autoLayoutViewHeader() {
        view.addSubview(viewHeader)
        viewHeader.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: 0).isActive = true
        viewHeader.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        viewHeader.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        viewHeader.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height/10).isActive = true
        autoLayoutTitleHeader1()
        autoLayoutTitleHeader2()
        autoLayoutBtnSearch()
    }
    private func autoLayoutTitleHeader1() {
        viewHeader.addSubview(titleHeader1)
        titleHeader1.bottomAnchor.constraint(equalTo: viewHeader.bottomAnchor, constant: -10).isActive = true
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
    // vòng đời
    override func viewDidLoad() {
        super.viewDidLoad()
        autoLayoutViewHeader()
        view.backgroundColor = .white
        autoLayoutCollectionViewHome()
        presenter = HomeControllerPresenterImp()
        presenter?.viewDidload(self, router: self)
    
    }
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
//        collectionViewHome.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        collectionViewHome.reloadData()
    }
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
        guard let dataCell = presenter?.dataForRowAt(indexPath: indexPath) else { return UICollectionViewCell() }
        switch dataCell[indexPath.item] {
        case is SongsLocal:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocalSongs", for: indexPath) as? LocalSongsController else { return UICollectionViewCell() }
            let interactor = LocalSongsInteractorIml(data: dataCell[indexPath.item])
            cell.inject(presenter: LocalSongsPresenterIml(interactor: interactor, router: self))
            return cell
        case is NhacOnline:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnlineSongs", for: indexPath) as? NhacOnlineCell else {
                return UICollectionViewCell()
            }
            let interactor = NhacOnlineInteracterImp(data: dataCell[indexPath.item])
            cell.inject(presenter: NhacOnlinePresenterImp(interacter: interactor, router: self))
//            cell.configure()
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

extension HomeController: HomeControllerInterface {
    func reloadDataCollectionView() {
        collectionViewHome.reloadData()
    }
}
