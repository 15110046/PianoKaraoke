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

    private var segment: CustomSegmentedControl = {
        let sgm = CustomSegmentedControl(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width-UIScreen.main.bounds.size.width/17-UIScreen.main.bounds.size.width/17-40, height: 30))
        sgm.translatesAutoresizingMaskIntoConstraints = false
        sgm.borderColor = .white
        sgm.textColor = .white
        sgm.selectorColor = .white
        sgm.backgroundColor = .clear
        sgm.selectorTextColor = .black
        sgm.borderWidth = 1
        sgm.commaSeparatedButtonTitles = "Cảm Âm, Lời Nhạc"
        return sgm
    }()
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
    private var lblLikesContent: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .gray
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "AmericanTypewriter", size: 15)
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
    private var lblAuthorContent: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .gray
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "AmericanTypewriter", size: 15)
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
    private var lblSongCatelogyContent: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .gray
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "AmericanTypewriter", size: 15)
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
        lbl.textColor = UIColor.hexStringToUIColor(hex: "F8D44B", alpha: 1)
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "AmericanTypewriter", size: 15)
        lbl.textAlignment = NSTextAlignment.left
        return lbl
    }()
    private var viewContent: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.hexStringToUIColor(hex: "1A103D", alpha: 1).cgColor
        view.layer.cornerRadius = 25
        view.layer.shadowColor = UIColor.hexStringToUIColor(hex: "000000", alpha: 1).cgColor
        view.layer.shadowOffset = CGSize(width: -7, height: 7)
        view.layer.shadowOpacity = 0.7
        view.backgroundColor = .clear
        return view
    }()
    private var buttonPiano: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Vào chơi", for: .normal)
        btn.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 23)
        btn.backgroundColor = UIColor.hexStringToUIColor(hex: "D48A5E", alpha: 1)
        btn.setTitleColor(UIColor.hexStringToUIColor(hex: "000000", alpha: 1), for: .normal)
        return btn
    }()

    private var viewImage: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.hexStringToUIColor(hex: "1D1F35", alpha: 1)
        return view
    }()
    private var imageKhung: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "background123456")
        return img
    }()
    private var imageSong: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    private var viewNgoiSao: Level = {
        let view = Level()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var scrollViewGenerality: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.backgroundColor = UIColor.hexStringToUIColor(hex: "1D1F35", alpha: 1)
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.showsVerticalScrollIndicator = false
        scrollview.layer.cornerRadius = 10
        return scrollview
    }()
    
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
                
                self.lblSongCatelogyContent.text = dataOnline.category
                self.lblLikesContent.text = String(dataOnline.likes)
                self.lblAuthorContent.text = dataOnline.author
              
                self.viewNgoiSao.config(numberStars: dataOnline.level)
            }
            self.autoLayoutViewContent()
        })
        self.navigationItem.title = "Thông tin bài hát"
        
    }
    @objc func changeValue(_ sender: CustomSegmentedControl) {
        presenter?.getData(completion: { (dataInfo) in
            switch dataInfo {
            case .succesWithCellLocal( _): break
                
            case .succesWithCellOnline(let dataOnline):
                guard let dataOnline = dataOnline else { return }
                switch sender.selectorSegmentIndex {
                case 0:
                        self.lblContentAcousticsNote.text = dataOnline.contentKaraoke
                case 1:
                        self.lblContentAcousticsNote.text = dataOnline.karaokeLyric
                default:
                    break
                }
                
            }
        })
      
       
        
    }
    private func autoLayoutSegment() {
        scrollViewGenerality.addSubview(segment)
        segment.topAnchor.constraint(equalTo: lblAuthor.bottomAnchor, constant: 40).isActive = true
        segment.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 20).isActive = true
        segment.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: -20).isActive = true
//        segment.heightAnchor.constraint(equalToConstant: 50).isActive = true
        segment.layoutIfNeeded()
        
        segment.addTarget(self, action: #selector(self.changeValue(_:)), for: .valueChanged)
    }
    private func autoContentAcousticsNote() {
        scrollViewGenerality.addSubview(lblContentAcousticsNote)
        lblContentAcousticsNote.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: 15).isActive = true
        lblContentAcousticsNote.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 3).isActive = true
        lblContentAcousticsNote.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: -3).isActive = true
        lblContentAcousticsNote.bottomAnchor.constraint(equalTo: scrollViewGenerality.bottomAnchor, constant: -50).isActive = true
    }
   
    private func autoLayoutviewNgoiSao() {
        lblLevelSong.layoutIfNeeded()
        scrollViewGenerality.addSubview(viewNgoiSao)
        viewNgoiSao.topAnchor.constraint(equalTo: lblLevelSong.topAnchor, constant: 0).isActive = true
        viewNgoiSao.leftAnchor.constraint(equalTo: lblLevelSong.rightAnchor, constant: 20).isActive = true
        viewNgoiSao.heightAnchor.constraint(equalToConstant: lblLevelSong.bounds.size.height).isActive = true
    }
    private func autoLayoutlblAuthorContent() {
        scrollViewGenerality.addSubview(lblAuthorContent)
        lblAuthorContent.topAnchor.constraint(equalTo: lblAuthor.topAnchor, constant: 0).isActive = true
        lblAuthorContent.leftAnchor.constraint(equalTo: lblAuthor.rightAnchor, constant: 20).isActive = true
        lblAuthorContent.bottomAnchor.constraint(equalTo: lblAuthor.bottomAnchor, constant: 0).isActive = true
    }
    private func autoLayoutlblLikesContent() {
        scrollViewGenerality.addSubview(lblLikesContent)
        lblLikesContent.topAnchor.constraint(equalTo: lblLikes.topAnchor, constant: 0).isActive = true
        lblLikesContent.bottomAnchor.constraint(equalTo: lblLikes.bottomAnchor, constant: 0).isActive = true
        lblLikesContent.leftAnchor.constraint(equalTo: lblLikes.rightAnchor, constant: 20).isActive = true
    }
    
    private func autoLayoutlblSongCatelogyContent() {
        scrollViewGenerality.addSubview(lblSongCatelogyContent)
        lblSongCatelogyContent.topAnchor.constraint(equalTo: lblSongCatelogy.topAnchor, constant: 0).isActive = true
        lblSongCatelogyContent.leftAnchor.constraint(equalTo: lblSongCatelogy.rightAnchor, constant: 20).isActive = true
        lblSongCatelogyContent.bottomAnchor.constraint(equalTo: lblSongCatelogy.bottomAnchor, constant: 0).isActive = true
    }
    private func autoAcousticsNote() {
//        scrollViewGenerality.addSubview(lblAcousticsNote)
//        lblAcousticsNote.topAnchor.constraint(equalTo: lblAuthor.bottomAnchor, constant: 40).isActive = true
//        lblAcousticsNote.centerXAnchor.constraint(equalTo: viewContent.centerXAnchor, constant: 0).isActive = true
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
        nameSonglbl.leftAnchor.constraint(equalTo: viewContent.leftAnchor, constant: 20).isActive = true
        nameSonglbl.rightAnchor.constraint(equalTo: viewContent.rightAnchor, constant: -20).isActive = true
    }
 
    private func autoLayoutViewImage() {
        scrollViewGenerality.addSubview(viewImage)
        viewImage.topAnchor.constraint(equalTo: scrollViewGenerality.topAnchor, constant: 0).isActive = true
        viewImage.rightAnchor.constraint(equalTo: viewContent.rightAnchor, constant: 0).isActive = true
        viewImage.leftAnchor.constraint(equalTo: viewContent.leftAnchor, constant: 0).isActive = true
        viewImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height/2.2).isActive = true
        
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
        autoLayoutviewNgoiSao()
        autoLayoutlblLikes()
        autoLayoutlblLikesContent()
        autoSongCategory()
        autoLayoutlblSongCatelogyContent()
        autoAuthor()
        autoLayoutlblAuthorContent()
        autoLayoutSegment()
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
    
    private func autoLayoutbtnPiano() {
        viewContent.layoutIfNeeded()
        let marginLeft = 0.16*viewContent.bounds.size.width
        viewContent.addSubview(buttonPiano)
        buttonPiano.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor, constant: marginLeft/2).isActive = true
        buttonPiano.centerXAnchor.constraint(equalTo: viewContent.centerXAnchor, constant: 0).isActive = true
        buttonPiano.heightAnchor.constraint(equalToConstant: marginLeft).isActive = true
        buttonPiano.leftAnchor.constraint(equalTo: viewContent.leftAnchor, constant: marginLeft).isActive = true
        buttonPiano.layer.cornerRadius = marginLeft/2
        buttonPiano.addTarget(self, action:#selector(self.click), for: .touchUpInside)
    }
    @objc func click() {
        buttonPiano.flash()
        presenter?.present()
    }
    private func autoLayoutViewContent() {
        view.addSubview(viewContent)
        let marginLeftRight = UIScreen.main.bounds.size.width/17
       
        viewContent.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor , constant: 0).isActive = true
        viewContent.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -marginLeftRight).isActive = true
        viewContent.leftAnchor.constraint(equalTo: view.leftAnchor, constant: marginLeftRight).isActive = true
        viewContent.layoutIfNeeded()
        viewContent.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0.2*viewContent.bounds.size.width).isActive = true
        
        autoLayoutScrollViewGenerality()
        autoLayoutbtnPiano()
    }
}
