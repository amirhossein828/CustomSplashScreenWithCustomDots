//
//  MyCollectionViewCell.swift
//  CustomPageControl Practice
//
//  Created by seyedamirhossein hashemi on 2017-11-23.
//  Copyright © 2017 Swyft Teechnology Inc. All rights reserved.
//

import UIKit

public class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var biggerImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public var isHighlighted: Bool {
        didSet {
            if isSelected {
                biggerImageView.isHidden = false
            }else {
                biggerImageView.isHidden = true
            }
//            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    // if the cell get selected it gets white
    override public var isSelected: Bool {
        didSet {
//            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
            if isSelected {
                biggerImageView.isHidden = false
                imageView.isHidden = true
            }else {
                biggerImageView.isHidden = true
                imageView.isHidden = false
            }
            
        }
    }
    
    
    
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
