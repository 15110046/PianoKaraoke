//
//  TableViewCellAccount.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/20/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import UIKit

class TableViewCellAccount: UITableViewCell {
    private var imageAvata: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .red
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 25
        return img
    }()
    private var nameAccount: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 14)
        return lbl
    }()
    func config(nameAccount: String, urlImage: String) {
        self.nameAccount.text = nameAccount
        LoadImageFromService.share.loadPhotoFromService(urlImage, completion: { [weak self] (img) in
            guard let strongSelf = self else { return }
            strongSelf.imageAvata.image = img
        })
        
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
        contentView.addSubview(imageAvata)
        contentView.addSubview(nameAccount)
        
        autoLayoutNameAccount()
        autoLayoutAvata()
    }
    private func autoLayoutAvata() {
        imageAvata.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        imageAvata.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        imageAvata.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        imageAvata.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageAvata.widthAnchor.constraint(equalTo: imageAvata.heightAnchor, multiplier: 1).isActive = true
        
    }
    private func autoLayoutNameAccount() {
        nameAccount.centerYAnchor.constraint(equalTo: imageAvata.centerYAnchor, constant: 0).isActive = true
        nameAccount.leftAnchor.constraint(equalTo: imageAvata.rightAnchor, constant: 20).isActive = true
        nameAccount.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
