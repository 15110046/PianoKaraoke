//
//  SearchTableViewCell.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/15/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    private var lblContentSearch: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    func config(lbl: String) {
        lblContentSearch.text = lbl
    }
    required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        autoLayoutLblContent()
    }
    private func autoLayoutLblContent() {
        contentView.addSubview(lblContentSearch)
        lblContentSearch.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        lblContentSearch.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        lblContentSearch.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        lblContentSearch.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
    }
    
}
