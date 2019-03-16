//
//  SearchViewController.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/15/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    private var presenter: SearchPresenter?
    
    func inject(presenter: SearchPresenter) {
        self.presenter = presenter
    }
    
    private lazy var tblSearch: UITableView = {
        let tbl = UITableView()
        tbl.delegate = self
        tbl.dataSource = self
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.backgroundColor = .white
        tbl.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        return tbl
    }()
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.delegate = self
        search.placeholder = "Nhập tên bài hát"
        search.showsCancelButton = true
        search.changeBackgroundUISearchBar()
        return search
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        searchBar.text = ""
        presenter?.textDidChange(searchText: "")
        tblSearch.reloadData()
    }
    private func mapUI() {
        view.addSubview(searchBar)
        view.addSubview(tblSearch)
        autoLayoutSearchBar()
        autoLayoutTblSearch()
    }
    private func autoLayoutSearchBar() {
        searchBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    }
    private func autoLayoutTblSearch() {
        tblSearch.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0).isActive = true
        tblSearch.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tblSearch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tblSearch.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        //        tblSearch.isHidden = true
    }
    private func createSearchBar(placeholder: String, delegate: UISearchBarDelegate) -> UISearchController {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = delegate
        searchController.searchBar.placeholder = placeholder
        searchController.searchBar.showsCancelButton = true
        searchController.searchBar.changeBackgroundUISearchBar()
        return searchController
    }
}
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.textDidChange(searchText: searchText)
        tblSearch.reloadData()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tblSearch.reloadData()
        presenter?.dismis()
    }
}
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter?.numberOfItemAfterSearched ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dataForRowAfterSearch = presenter?.dataForCellAfterSearch(at: indexPath),
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        cell.config(lbl: dataForRowAfterSearch[indexPath.row].name)
        return cell
    }
}
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dataForRowAfterSearch = presenter?.dataForCellAfterSearch(at: indexPath) else { return }
        presenter?.pushTo(key: dataForRowAfterSearch[indexPath.row].key)
    }
}
extension UISearchBar {
    func changeBackgroundColorTextFiled(color: UIColor) {
        for view in self.subviews {
            for subview in view.subviews {
                if subview is UITextField {
                    let textField: UITextField = subview as? UITextField ?? UITextField()
                    textField.backgroundColor = color
                }
            }
        }
    }
    func changeBackgroundUISearchBar() {
        for subView in self.subviews {
            for view in subView.subviews {
                if view.isKind(of: NSClassFromString("UINavigationButton")!) {
                    let cancelButton = view as! UIButton
                    cancelButton.setTitleColor(UIColor.hexStringToUIColor(hex: "FFFFFF", alpha: 1), for: .normal)
                    cancelButton.setTitle("Huỷ", for: .normal)
                }
                if view.isKind(of: NSClassFromString("UISearchBarBackground")!) {
                    let imageView = view as! UIImageView
                    //                    imageView.removeFromSuperview()
                    imageView.backgroundColor = .red
                }
            }
        }
    }
}
protocol SearchViewControllerInterface {
    func reloadData()
}
extension SearchViewController: SearchViewControllerInterface {
    func reloadData() {
        self.tblSearch.reloadData()
    }
}
