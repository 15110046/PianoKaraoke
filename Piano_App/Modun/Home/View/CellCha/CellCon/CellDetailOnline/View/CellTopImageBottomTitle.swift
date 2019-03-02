//
//  CellTopImageBottomTitle.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/12/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit

class CellTopImageBottomTitle: UICollectionViewCell {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layoutIfNeeded()
        autoLayoutViewImage()
        autoLayoutViewTitle()
        contentView.backgroundColor = UIColor.hexStringToUIColor(hex: "1D1F35", alpha: 1)
    }
    private var areaViewImage: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.hexStringToUIColor(hex: "1D1F35", alpha: 1)
        return view
    }()
    private var areaViewTitle: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor =  UIColor.hexStringToUIColor(hex: "1D1F35", alpha: 1)
        return view
    }()
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
    func config(imageSong: String, titleSong: String?) {
        self.titleSong.text = titleSong
        LoadImageFromService.share.loadPhotoFromService(imageSong, completion: { (img) in
            self.imageSong.image = img
        })
    }
    private func autoLayoutTitleSong() {
        areaViewTitle.addSubview(titleSong)
        titleSong.leftAnchor.constraint(equalTo: areaViewTitle.leftAnchor, constant: 0).isActive = true
        titleSong.rightAnchor.constraint(equalTo: areaViewTitle.rightAnchor, constant: 0).isActive = true
        titleSong.topAnchor.constraint(equalTo: areaViewTitle.topAnchor, constant: 10).isActive = true
    }
    private func autoLayoutImageSong() {
        areaViewImage.addSubview(imageSong)
        imageSong.topAnchor.constraint(equalTo: areaViewImage.topAnchor, constant: 0).isActive = true
        imageSong.leftAnchor.constraint(equalTo: areaViewImage.leftAnchor, constant: 0).isActive = true
        imageSong.rightAnchor.constraint(equalTo: areaViewImage.rightAnchor, constant: 0).isActive = true
        imageSong.bottomAnchor.constraint(equalTo: areaViewImage.bottomAnchor, constant: 0).isActive = true
    }
    private func autoLayoutViewImage() {
        contentView.addSubview(areaViewImage)
        areaViewImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        areaViewImage.heightAnchor.constraint(equalToConstant: 0.7*contentView.bounds.size.height).isActive = true
        areaViewImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        areaViewImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        autoLayoutImageSong()
    }
    private func autoLayoutViewTitle() {
        contentView.addSubview(areaViewTitle)
        areaViewTitle.topAnchor.constraint(equalTo: areaViewImage.bottomAnchor, constant: 0).isActive = true
        areaViewTitle.leftAnchor.constraint(equalTo: areaViewImage.leftAnchor, constant: 0).isActive = true
        areaViewTitle.rightAnchor.constraint(equalTo: areaViewImage.rightAnchor, constant: 0).isActive = true
        areaViewTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        autoLayoutTitleSong()
    }
}

