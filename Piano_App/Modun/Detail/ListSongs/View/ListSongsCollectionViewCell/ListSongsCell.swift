//
//  ListSongsCell.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/5/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import UIKit

class ListSongsCell: UICollectionViewCell {
    private var imageSong: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    private var nameSong: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        
        lbl.font = UIFont(name: "AmericanTypewriter", size: 18)
        return lbl
    }()
    private var btnViewDetail: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Xem thêm", for: .normal)
        btn.titleLabel?.font = UIFont(name: "AmericanTypewriter-CondensedLight", size: 12)
        btn.titleLabel?.textColor = .white
        return btn
    }()
    func config(nameSong: String, nameImageSong: String, completion: @escaping (CGFloat) -> ())  {
        self.nameSong.text = nameSong
        LoadImageFromService.share.loadPhotoFromService(nameImageSong) { [weak self] (image) in
            guard let self = self else { return }
            self.imageSong.image = image
            completion(self.imageSong.bounds.size.height)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //        self.layer.cornerRadius = 10
        contentView.layoutIfNeeded()
        self.backgroundColor = UIColor.hexStringToUIColor(hex: "1D1F35", alpha: 1)

        autoLayoutImageSong()
        autoLayoutNameSong()
        autoLayoutbtnViewDetail()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func autoLayoutbtnViewDetail() {
        contentView.addSubview(btnViewDetail)
        btnViewDetail.topAnchor.constraint(equalTo: nameSong.bottomAnchor, constant: 0).isActive = true
        btnViewDetail.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 2).isActive = true
        btnViewDetail.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    private func autoLayoutNameSong() {
        contentView.addSubview(nameSong)
        nameSong.topAnchor.constraint(equalTo: imageSong.bottomAnchor, constant: 0).isActive = true
        nameSong.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        nameSong.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        
    }
    
    private func autoLayoutImageSong() {
        contentView.addSubview(imageSong)
        contentView.addSubview(nameSong)
        imageSong.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        imageSong.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        imageSong.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        imageSong.bottomAnchor.constraint(equalTo: nameSong.topAnchor, constant: 0).isActive = true
//                imageSong.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //        imageSong.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        //        imageSong.heightAnchor.constraint(equalTo: imageSong.widthAnchor, multiplier: 1).isActive = true
    }
}

