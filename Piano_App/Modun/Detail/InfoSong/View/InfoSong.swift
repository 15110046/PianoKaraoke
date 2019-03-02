//
//  InfoSong.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/18/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit

class InfoSong: UIViewController {
    
    private var presenter: InfoSongPresenter?
    
    func inject(presnter: InfoSongPresenter) {
        self.presenter = presnter
    }
    private var nameSonglbl: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "AmericanTypewriter-Bold", size: 23)
        lbl.textAlignment = NSTextAlignment.left
        return lbl
    }()
    private var lblLevelSong: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.numberOfLines = 0
        lbl.text = "Độ khó:"
        lbl.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        lbl.textAlignment = NSTextAlignment.left
        return lbl
    }()
    private var lblLikes: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.numberOfLines = 0
        lbl.text = "Lượt thích:"
        lbl.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        lbl.textAlignment = NSTextAlignment.left
        return lbl
    }()
    private var lblAuthor: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.numberOfLines = 0
        lbl.text = "Tác giả:"
        lbl.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        lbl.textAlignment = NSTextAlignment.left
        return lbl
    }()
    private var lblSongCatelogy: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.numberOfLines = 0
        lbl.text = "Thể loại:"
        lbl.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        lbl.textAlignment = NSTextAlignment.left
        return lbl
    }()
    private var lblAcousticsNote: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.numberOfLines = 0
        lbl.text = "CẢM ÂM"
        lbl.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        lbl.textAlignment = NSTextAlignment.center
        return lbl
    }()
    private var lblContentAcousticsNote: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .gray
        lbl.numberOfLines = 0
//        lbl.text = "Anh tìm nỗi nhớ, anh tìm quá khứ \n mi re mi sol, mi re mi sol \n Nhớ lắm, kí ức anh và em \n la la, la la sol fa sol "
        lbl.font = UIFont(name: "AmericanTypewriter", size: 15)
        lbl.textAlignment = NSTextAlignment.justified
        return lbl
    }()
    private var viewContent: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.hexStringToUIColor(hex: "1D1F35", alpha: 1)
        return view
    }()
    private var buttonPiano: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Vào chơi", for: .normal)
        btn.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor.hexStringToUIColor(hex: "D48A5E", alpha: 1), for: .normal)
        btn.layer.cornerRadius = 22
        return btn
    }()
//    private var viewHeader: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = UIColor.hexStringToUIColor(hex: "1D1F35", alpha: 1)
//        return view
//    }()
    private var viewImage: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.hexStringToUIColor(hex: "1D1F35", alpha: 1)
        return view
    }()
    private var imageKhung: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage.init(named: "backgroundPiano")
        return img
    }()
    private var imageSong: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    private var scrollViewGenerality: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.backgroundColor = .clear
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.showsVerticalScrollIndicator = false
        return scrollview
    }()
//        override func viewWillAppear(_ animated: Bool) {
//                    self.navigationController?.isNavigationBarHidden = false
//                }
    private func setUpUINaviationItem() {
        navigationItem.title = "Thông tin bài hát"
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = .blackOpaque
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "AmericanTypewriter-Bold", size: 20)!,NSAttributedString.Key.foregroundColor: UIColor.hexStringToUIColor(hex: "D48A5E", alpha: 1)]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hexStringToUIColor(hex: "17182C", alpha: 1)
        
        presenter?.getData(completion: { (dataInfo) in
            print(dataInfo)

            switch dataInfo {
            case .succesWithCellLocal(let dataLocal):
                guard let dataLocal = dataLocal as? SongsLocalDetail else { return }
                self.imageSong.image = dataLocal.getImageSong()
                self.nameSonglbl.text = dataLocal.getNameSong()
            case .succesWithCellOnline(let dataOnline):
                guard let dataOnline = dataOnline else { return }
                LoadImageFromService.share.loadPhotoFromService(dataOnline.imageSong, completion: { (img) in
                    self.imageSong.image = img
                })
                print(dataOnline.nameSong)
                self.nameSonglbl.text = dataOnline.nameSong
                self.lblContentAcousticsNote.text = dataOnline.contentKaraoke
            }
//            self.autoLayoutViewHeader()
            self.autoLayoutViewContent()
        })
        setUpUINaviationItem()
    }
    private func autoContentAcousticsNote() {
        scrollViewGenerality.addSubview(lblContentAcousticsNote)
        lblContentAcousticsNote.topAnchor.constraint(equalTo: lblAcousticsNote.bottomAnchor, constant: 20).isActive = true
        lblContentAcousticsNote.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 3).isActive = true
        lblContentAcousticsNote.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: -3).isActive = true
        lblContentAcousticsNote.bottomAnchor.constraint(equalTo: scrollViewGenerality.bottomAnchor, constant: -50).isActive = true
    }
    private func autoAcousticsNote() {
        scrollViewGenerality.addSubview(lblAcousticsNote)
        lblAcousticsNote.topAnchor.constraint(equalTo: lblAuthor.bottomAnchor, constant: 20).isActive = true
        lblAcousticsNote.centerXAnchor.constraint(equalTo: viewContent.centerXAnchor, constant: 0).isActive = true
    }
    private func autoAuthor() {
        scrollViewGenerality.addSubview(lblAuthor)
        lblAuthor.topAnchor.constraint(equalTo: lblSongCatelogy.bottomAnchor, constant: 20).isActive = true
        lblAuthor.leadingAnchor.constraint(equalTo: lblLevelSong.leadingAnchor, constant: 0).isActive = true
    }
    
    private func autoSongCategory() {
        scrollViewGenerality.addSubview(lblSongCatelogy)
        lblSongCatelogy.topAnchor.constraint(equalTo: lblLikes.bottomAnchor, constant: 20).isActive = true
        lblSongCatelogy.leadingAnchor.constraint(equalTo: lblLevelSong.leadingAnchor, constant: 0).isActive = true
    }
    
    private func autoLayoutlblLikes() {
        scrollViewGenerality.addSubview(lblLikes)
        lblLikes.topAnchor.constraint(equalTo: lblLevelSong.bottomAnchor, constant: 20).isActive = true
        lblLikes.leadingAnchor.constraint(equalTo: lblLevelSong.leadingAnchor, constant: 0).isActive = true
    }
    
    private func autoLayoutlblLevel() {
        scrollViewGenerality.addSubview(lblLevelSong)
        lblLevelSong.topAnchor.constraint(equalTo: nameSonglbl.bottomAnchor, constant: 20).isActive = true
        lblLevelSong.leadingAnchor.constraint(equalTo: nameSonglbl.leadingAnchor, constant: 0).isActive = true
    }
    
    private func autoLayoutNameSonglbl() {
        scrollViewGenerality.addSubview(nameSonglbl)
        nameSonglbl.topAnchor.constraint(equalTo: viewImage.bottomAnchor, constant: 0).isActive = true
        nameSonglbl.leftAnchor.constraint(equalTo: scrollViewGenerality.leftAnchor, constant: 20).isActive = true
        nameSonglbl.rightAnchor.constraint(equalTo: scrollViewGenerality.rightAnchor, constant: -20).isActive = true
    }
 
    private func autoLayoutViewImage() {
        scrollViewGenerality.addSubview(viewImage)
        viewImage.topAnchor.constraint(equalTo: scrollViewGenerality.topAnchor, constant: 0).isActive = true
        viewImage.rightAnchor.constraint(equalTo: viewContent.rightAnchor, constant: 0).isActive = true
        viewImage.leftAnchor.constraint(equalTo: viewContent.leftAnchor, constant: 0).isActive = true
        viewImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height/1.8).isActive = true
        
        autoLayoutImageSong()
        autoLayoutImageKhung()
        
    }
    private func autoLayoutScrollViewGenerality() {
        viewContent.layoutIfNeeded()
        let height = viewContent.bounds.size.height
        let width = viewContent.bounds.size.width
        viewContent.addSubview(scrollViewGenerality)
        scrollViewGenerality.topAnchor.constraint(equalTo: viewContent.topAnchor, constant: 0).isActive = true
        scrollViewGenerality.rightAnchor.constraint(equalTo: viewContent.rightAnchor, constant: 0).isActive = true
        scrollViewGenerality.leftAnchor.constraint(equalTo: viewContent.leftAnchor, constant: 0).isActive = true
        scrollViewGenerality.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor, constant: 0).isActive = true
        scrollViewGenerality.heightAnchor.constraint(equalToConstant: height).isActive = true
        scrollViewGenerality.widthAnchor.constraint(equalToConstant: width).isActive = true

        autoLayoutViewImage()
        autoLayoutNameSonglbl()
        autoLayoutlblLevel()
        autoLayoutlblLikes()
        autoSongCategory()
        autoAuthor()
        autoAcousticsNote()
        autoContentAcousticsNote()
    }
    private func autoLayoutImageSong() {
        viewImage.addSubview(imageSong)
        imageSong.topAnchor.constraint(equalTo: viewImage.topAnchor, constant: 0).isActive = true
        imageSong.rightAnchor.constraint(equalTo: viewImage.rightAnchor, constant: 0).isActive = true
        imageSong.leftAnchor.constraint(equalTo: viewImage.leftAnchor, constant: 0).isActive = true
        imageSong.bottomAnchor.constraint(equalTo: viewImage.bottomAnchor, constant: 0).isActive = true
    }
    private func autoLayoutImageKhung() {
        viewImage.addSubview(imageKhung)
        imageKhung.topAnchor.constraint(equalTo: viewImage.topAnchor, constant: 0).isActive = true
        imageKhung.rightAnchor.constraint(equalTo: viewImage.rightAnchor, constant: 0).isActive = true
        imageKhung.leftAnchor.constraint(equalTo: viewImage.leftAnchor, constant: 0).isActive = true
        imageKhung.bottomAnchor.constraint(equalTo: viewImage.bottomAnchor, constant: 0).isActive = true
    }
//    private func autoLayoutViewHeader() {
//        view.addSubview(viewHeader)
//        viewHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        viewHeader.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        viewHeader.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        viewHeader.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height/10).isActive = true
//    }

    
    
    private func autoLayoutbtnPiano() {
        viewContent.layoutIfNeeded()
        let marginLeft = 0.25*viewContent.bounds.size.width
        viewContent.addSubview(buttonPiano)
        buttonPiano.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor, constant: 22).isActive = true
        buttonPiano.centerXAnchor.constraint(equalTo: viewContent.centerXAnchor, constant: 0).isActive = true
        buttonPiano.heightAnchor.constraint(equalToConstant: 44).isActive = true
        buttonPiano.leftAnchor.constraint(equalTo: viewContent.leftAnchor, constant: marginLeft).isActive = true

        buttonPiano.addTarget(self, action:#selector(self.click), for: .touchUpInside)
    }
    @objc func click() {
        presenter?.present()
    }
    private func autoLayoutViewContent() {
        view.addSubview(viewContent)
        viewContent.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor , constant: 0).isActive = true
        viewContent.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        viewContent.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        viewContent.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.size.height/20).isActive = true
        
        autoLayoutScrollViewGenerality()
        autoLayoutbtnPiano()
    }
}
