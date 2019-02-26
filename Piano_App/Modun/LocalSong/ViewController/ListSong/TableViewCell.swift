//
//  TableViewCell.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/5/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    private var nameSong: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    private func autoLayoutnameSong() {
        contentView.addSubview(nameSong)
       nameSong.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        nameSong.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    func configUI(namesong: String?) {
        nameSong.text = namesong
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        autoLayoutnameSong()
    }
}
