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
        lbl.textColor = UIColor.hexStringToUIColor(hex: "000000", alpha: 1)
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        return lbl
    }()
    private var btnViewDetail: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("•••", for: .normal)
        btn.titleLabel?.textColor = UIColor.red
        return btn
    }()
    private var visualEffectView: UIVisualEffectView = {
        var blurEffect = UIBlurEffect(style: UIBlurEffect.Style.prominent)
        let vev = UIVisualEffectView(effect: blurEffect)
        vev.translatesAutoresizingMaskIntoConstraints = false
        vev.alpha = 0.7
        return vev
    }()
    private var viewNgoiSao: Level = {
        let view = Level()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        contentView.layoutIfNeeded()
        self.backgroundColor = UIColor.hexStringToUIColor(hex: "1D1F35", alpha: 1)
        
        autoLayoutImageSong()

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func autoLayoutViewLevel() {
        visualEffectView.layoutIfNeeded()
        let height = (contentView.bounds.size.height/3)/3
        visualEffectView.contentView.addSubview(viewNgoiSao)
        viewNgoiSao.bottomAnchor.constraint(equalTo: visualEffectView.contentView.bottomAnchor, constant: -5).isActive = true
        viewNgoiSao.rightAnchor.constraint(equalTo: visualEffectView.contentView.rightAnchor, constant: -10).isActive = true
        viewNgoiSao.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    private func autoLayoutbtnViewDetail() {
        visualEffectView.contentView.addSubview(btnViewDetail)
        btnViewDetail.rightAnchor.constraint(equalTo:  visualEffectView.contentView.rightAnchor, constant: -10).isActive = true
        btnViewDetail.bottomAnchor.constraint(equalTo:  visualEffectView.contentView.bottomAnchor, constant: 5).isActive = true
    }
    private func autoLayoutNameSong() {
        visualEffectView.contentView.addSubview(nameSong)
        nameSong.topAnchor.constraint(equalTo: visualEffectView.contentView.topAnchor, constant: 10).isActive = true
        nameSong.leftAnchor.constraint(equalTo: visualEffectView.contentView.leftAnchor, constant: 10).isActive = true
        nameSong.rightAnchor.constraint(equalTo: visualEffectView.contentView.rightAnchor, constant: -5).isActive = true

    }
    private func autoLayoutVisualEffectView() {
        imageSong.addSubview(visualEffectView)
        visualEffectView.bottomAnchor.constraint(equalTo: imageSong.bottomAnchor, constant: 0).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: imageSong.rightAnchor, constant: 0).isActive = true
        visualEffectView.leftAnchor.constraint(equalTo: imageSong.leftAnchor, constant: 0).isActive = true
        imageSong.layoutIfNeeded()
        visualEffectView.heightAnchor.constraint(equalToConstant: imageSong.bounds.size.height/3).isActive = true
        autoLayoutNameSong()
        autoLayoutViewLevel()
//        autoLayoutbtnViewDetail()
    }
    private func autoLayoutImageSong() {
        contentView.addSubview(imageSong)
        imageSong.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        imageSong.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        imageSong.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        imageSong.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        imageSong.layer.masksToBounds = true
        imageSong.layer.cornerRadius = 20
         autoLayoutVisualEffectView()
    }
}

