//
//  CustomLayoutColectionView.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/5/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
import UIKit
protocol CustomLayoutColectionViewDelegate {
    func numberItem() -> Int
    func collectionViewWitdhSize() -> Float
    func collectionViewHeightSize(sizeForItemAt indexPath: IndexPath) -> Float
    func heightForText(atIndexPath indexPath: IndexPath) -> CGFloat
    func heightForImage(atIndexPath indexPath: IndexPath) -> CGFloat
}

class CustomLayoutColectionView: UICollectionViewLayout {
    var delegate: CustomLayoutColectionViewDelegate?
    override init() {
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var numberItem: Int {
        return delegate?.numberItem() ?? 0
    }
    
    private var arrAttributes = [UICollectionViewLayoutAttributes]()
    private var contentSize = CGSize.zero
    private var contentLeftHeight: CGFloat = 100
    private var contentRightHeight: CGFloat = 100
    override func prepare() {
        super.prepare()
        for i in 0..<numberItem {
            let att = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: i, section: 0))
            let size = CGFloat.init(delegate?.collectionViewWitdhSize() ?? 0)
            guard let sizeHeighText = delegate?.heightForText(atIndexPath: IndexPath(item: i, section: 0))
//           ,let sizeHeightImage = delegate?.heightForImage(atIndexPath: IndexPath.init(item: i, section: 0))
                else { return }
             let sizeHeightImage = CGFloat(150)
            var x: CGFloat = 0
            var y: CGFloat = 0
            
            if i % 2 == 0 {
                x = 10
                contentLeftHeight += (sizeHeightImage) + (sizeHeighText) + 10
                y = CGFloat(contentLeftHeight) - (sizeHeightImage) - (sizeHeighText)
            } else {
                x = (collectionView?.frame.size.width ?? 0)/2 + 5
                contentRightHeight += (sizeHeightImage) + (sizeHeighText) + 10
                y =  contentRightHeight - (sizeHeightImage) - (sizeHeighText)
            }
            att.frame = CGRect(x: x, y: y , width: size , height: (sizeHeightImage) + (sizeHeighText))
            
            arrAttributes.append(att )
        }
        if Int(contentLeftHeight) > Int(contentRightHeight) {
            contentSize = CGSize(width: self.collectionView?.frame.width ?? 0, height:  contentLeftHeight + 100)
        }
        else {
            contentSize = CGSize(width: self.collectionView?.frame.width ?? 0, height:   contentRightHeight + 100)
        }
    }
    
    override var collectionViewContentSize: CGSize {
        return contentSize
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes = [UICollectionViewLayoutAttributes]()
        for att in arrAttributes {
            if att.frame.intersects(rect) {
                attributes.append(att)
            }
        }
        return attributes
    }
}


