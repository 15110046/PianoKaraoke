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
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "AmericanTypewriter-Bold", size: 23)
        return lbl
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
        self.backgroundColor = .yellow
        autoLayoutImageSong()
        autoLayoutNameSong()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func autoLayoutNameSong() {
        contentView.addSubview(nameSong)
        nameSong.topAnchor.constraint(equalTo: imageSong.bottomAnchor, constant: 0).isActive = true
        nameSong.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        nameSong.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        nameSong.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
    }

    private func autoLayoutImageSong() {
        contentView.addSubview(imageSong)
        imageSong.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        imageSong.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        imageSong.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        imageSong.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        imageSong.heightAnchor.constraint(equalTo: imageSong.widthAnchor, multiplier: 1).isActive = true
    }
}

