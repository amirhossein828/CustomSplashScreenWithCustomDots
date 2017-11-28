//
//  SlidesCell.swift
//  CustomPageControl Practice
//
//  Created by seyedamirhossein hashemi on 2017-11-24.
//  Copyright © 2017 Swyft Teechnology Inc. All rights reserved.
//

import UIKit

public class SlidesCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewOfCell()
    }
    func setupViewOfCell(){
        self.frame = self.bounds
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViewOfCell()
    }

}
