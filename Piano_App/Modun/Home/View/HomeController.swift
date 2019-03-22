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
    func reloadDataTableView()
}
class HomeController: UIViewController {
    //presenter
    private var presenter: HomeControllerPresenter?
    // bien
    private var btnSearch: UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(UIImage (named: "search-icon"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(clickSearchBar), for: .touchDown)
        return btn
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
    private lazy var tableViewAccount: UITableView = {
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.delegate = self
        tbl.dataSource = self
        tbl.separatorColor = .white
        tbl.register(TableViewCellAccount.self, forCellReuseIdentifier: "TableViewCellAccount")
        tbl.register(CellLogout.self, forCellReuseIdentifier: "CellLogout")
        return tbl
    }()
    private func mapUI() {
        
        view.addSubview(collectionViewHome)
        view.addSubview(tableViewAccount)
        autoLayoutCollectionViewHome()
        autoLayoutTableViewAccount()
        
        
    }
    func transformRight() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.tableViewAccount.transform = CGAffineTransform(translationX: self.witdh, y: 0)
        }) { (abc) in
        }
    }
    func transformLeft() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.tableViewAccount.transform = CGAffineTransform(translationX: -self.witdh, y: 0)
        }) { (abc) in
        }
    }
    private var isTapMoreButton = false {
        didSet {
            switch isTapMoreButton {
            case true:
                transformRight()
            case false:
                transformLeft()
            }
        }
        
    }
    private var constrainsWitdhTableViewAccountIsZero: NSLayoutConstraint?
    private let witdh = 3/4*UIScreen.main.bounds.size.width
    private func autoLayoutTableViewAccount() {
        constrainsWitdhTableViewAccountIsZero =  tableViewAccount.widthAnchor.constraint(equalToConstant: 0)
        let witdhConstrain = tableViewAccount.widthAnchor.constraint(equalToConstant: witdh)
        tableViewAccount.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -witdh).isActive = true
        tableViewAccount.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableViewAccount.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        witdhConstrain.isActive = true
    }
    @objc private func clickSearchBar() {
        self.presenter?.presentSearchViewController()
    }
    @objc private func clickMoreBar() {
        
        switch isTapMoreButton {
        case true: isTapMoreButton = false
        case false: isTapMoreButton = true
        }
//        UserDefaults.standard.removeObject(forKey: "UID")
        print("userdefault: \(UserDefaults.standard.string(forKey: "UID"))")
    }
    
    private func autoLayoutCollectionViewHome() {
        collectionViewHome.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        collectionViewHome.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        collectionViewHome.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        collectionViewHome.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func inject(presenter: HomeControllerPresenter?) {
        self.presenter = presenter
    }
    // vòng đời
    private let titleHome = "Home"
    override func viewDidLoad() {
        super.viewDidLoad()
        mapUI()
        //        presenter = HomeControllerPresenterImp()
        presenter?.viewDidload(self)
        self.navigationItem.title = titleHome
        view.backgroundColor = .red
        setUpLeftBarButtonItem()
        setUpRightBarButtonItem()
    }
    private func setUpLeftBarButtonItem() {
        let barButtonMore = UIBarButtonItem(image: UIImage(named: "more-button"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(clickMoreBar))
        barButtonMore.tintColor = UIColor.hexStringToUIColor(hex: "FFFFFF", alpha: 1)
        self.navigationItem.leftBarButtonItem = barButtonMore
    }
    private func setUpRightBarButtonItem() {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(clickSearchBar))
        barButtonItem.tintColor = UIColor.hexStringToUIColor(hex: "FFFFFF", alpha: 1)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Home"
        //        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        guard let dataCell = presenter?.dataForCell() else { return UICollectionViewCell() }
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
    func reloadDataTableView() {
        tableViewAccount.reloadData()
    }
    
    func reloadDataCollectionView() {
        collectionViewHome.reloadData()
    }
}
extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRow() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dataForRow = presenter?.dataForRowTableView()
            else { return UITableViewCell() }
        switch dataForRow[indexPath.row] {
        case let dataUser as InfoUserModel:
             guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellAccount", for: indexPath) as? TableViewCellAccount else { return UITableViewCell() }
            cell.config(nameAccount: dataUser.name, urlImage: dataUser.avata)
            return cell
        case let buttonLogout as Logout:
              guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellLogout", for: indexPath) as? CellLogout else { return UITableViewCell() }
            cell.config(name: buttonLogout.nameButton)
            return cell
        default:
            break
        }
        return UITableViewCell() 
    }
    
    
}
extension HomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       guard let maxlenght = presenter?.numberOfRow() else { return }
        if indexPath.row == maxlenght - 1 {
            self.showAlertHaveCancel(withTitle: "Đăng xuất", withMessage: "Bạn có muốn đăng xuất?")
        }
    }
}

