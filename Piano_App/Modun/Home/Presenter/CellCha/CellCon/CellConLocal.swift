//
//  CellTopImageBottomTitle.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/12/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit

class CellConLocal: UICollectionViewCell {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoLayoutImageSong()
    }
    private var imageSong: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 10
        return img
    }()
    private var titleSong: UILabel = {
        let txt = UILabel()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = UIFont(name: "TimesNewRomanPSMT", size: 18)
        txt.textColor = .white
        txt.numberOfLines = 0
        txt.textAlignment = .center
        return txt
    }()
    
    func config(imageSong: UIImage?, titleSong: String?) {
        self.titleSong.text = titleSong
        self.imageSong.image = imageSong
    }
    private func autoLayoutTitleSong() {
        imageSong.addSubview(titleSong)
        titleSong.leftAnchor.constraint(equalTo: imageSong.leftAnchor, constant: 0).isActive = true
        titleSong.rightAnchor.constraint(equalTo: imageSong.rightAnchor, constant: 0).isActive = true
        titleSong.bottomAnchor.constraint(equalTo: imageSong.bottomAnchor, constant: -5).isActive = true
    }
    private func autoLayoutImageSong() {
        contentView.addSubview(imageSong)
        imageSong.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        imageSong.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        imageSong.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        imageSong.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        autoLayoutTitleSong()
    }
}

