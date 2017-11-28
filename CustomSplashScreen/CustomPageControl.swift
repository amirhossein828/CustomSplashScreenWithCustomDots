//
//  CustomPageControl.swift
//  CustomPageControl Practice
//
//  Created by seyedamirhossein hashemi on 2017-11-23.
//  Copyright © 2017 Swyft Teechnology Inc. All rights reserved.
//

import Foundation
import UIKit

  public class CustomPageControl : UIView , UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    // Outlets
    @IBOutlet public var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    // Properties
    public weak var delegate : CustomPageCntrolDelegate?
    public weak var changeSlidesDelegate : ChangeTheSlidesDelegate?
    var numberOfShapes : Int = 0
    let cellId = "cellId"
    var arrayOfImages : [UIImage]?

    override public init(frame: CGRect) {
        super.init(frame: frame)
      
    }
    public func setup() {
        // Load CustomPageControl view
        let myCustomBundle = Bundle(for: CustomPageControl.self)
        myCustomBundle.loadNibNamed("CustomPageControl", owner: self, options: nil)
        let myCollectioCellBundle = Bundle(for: MyCollectionViewCell.self)
        addSubview(contentView)
        // make the frame of collection view as same as the view which it is inside it.
        contentView.frame = self.bounds
        // Make the size of collection view changable
        contentView.autoresizingMask = [.flexibleWidth, .flexibleWidth]
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        // make the cell
        let myCell = UINib(nibName: "MyCollectionViewCell", bundle: myCollectioCellBundle)
        collectionView.register(myCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            // setup the view
            setup()
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.numberOfShapes = (delegate?.numberOfShapes())!
        return self.numberOfShapes
    }
    
  
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
   
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCollectionViewCell

        self.arrayOfImages =  self.delegate?.arrayOfIconImages()
        cell.imageView.image = self.arrayOfImages![indexPath.row].withRenderingMode(.alwaysTemplate)
        cell.biggerImageView.image = self.arrayOfImages![indexPath.row].withRenderingMode(.alwaysTemplate)
        cell.backgroundColor = UIColor.clear
        cell.autoresizingMask = [.flexibleWidth, .flexibleWidth]
        cell.imageView.autoresizingMask = [.flexibleWidth, .flexibleWidth]
        return cell
    }
    
    
    // put the size of cell
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / CGFloat(self.numberOfShapes),height: frame.height)
    }
    // the space between cell equal zero
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Tells the delegate that the item at the specified index path was selected.
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // it runs the method scrollToMenuIndex in homeViewController to take the pages in homeViewController to the index which the menubar is
        changeSlidesDelegate?.scrollToMenuIndex(menuIndex: indexPath.item)
    }
  
}

// Delegate changing of slides to CustomPageControl class.
public protocol ChangeTheSlidesDelegate : class{
    func scrollToMenuIndex(menuIndex: Int)
}






