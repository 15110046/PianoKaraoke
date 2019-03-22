//
//  TableViewCellAccount.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/20/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import UIKit

class CellLogout: UITableViewCell {

    private var name: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textColor = .blue
        lbl.font = UIFont.init(name: "TimesNewRomanPS-BoldMT", size: 14)
        return lbl
    }()
    func config(name: String) {
        self.name.text = name
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //        self.backgroundColor = .red
        mapUI()
    }
    private func mapUI() {
        contentView.addSubview(name)
        autoLayoutName()
    }
    private func autoLayoutName() {
        name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
