//
//  Slides.swift
//  CustomPageControl Practice
//
//  Created by seyedamirhossein hashemi on 2017-11-24.
//  Copyright © 2017 Swyft Teechnology Inc. All rights reserved.
//

import UIKit

public class Slides: UIView, UICollectionViewDelegate, UICollectionViewDataSource
, UICollectionViewDelegateFlowLayout{
    // Outlets
    @IBOutlet public weak var customPage: CustomPageControl!
    @IBOutlet var MainView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    // Properties
    let cellIdentifier = "Cell"
    var arrayOfSlides : [UIImage]?
    public weak var delegate : CustomPageControlDelegate?
    var arrayOfSlidesImages : [UIImage]?
    var arrayOfIconImages : [UIImage]?
    var numberOfIcons : Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        // test github
        // test2 github
        // test3 github
    }
    
    public func setupView(){
        let mySlideBundle = Bundle(for: Slides.self)
        mySlideBundle.loadNibNamed("Slides", owner: self, options: nil)
        addSubview(self.MainView)
        self.MainView.addSubview(self.customPage)
        
        // make the frame of collection view as same as the view which it is inside it.
        self.MainView.frame = self.bounds
        // Make the size of collection view changable
        self.MainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let mySlideCellBundle = Bundle(for: SlidesCell.self)
        let mySlideCell = UINib(nibName: "SlidesCell", bundle: mySlideCellBundle)
        self.collectionView.register(mySlideCell.self, forCellWithReuseIdentifier: cellIdentifier)
        self.customPage.changeSlidesDelegate = self
    }
    

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.numberOfIcons = (self.delegate?.numberOfShapes())!
        return self.numberOfIcons
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! SlidesCell
        self.arrayOfSlides  = self.delegate?.arrayOfImages()
        cell.imageView.image = self.arrayOfSlides?[indexPath.row]
        return cell
    }
    // Make each cell as big as a screen
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width,height: collectionView.bounds.height)
    }
    // the space between cell equal zero
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    // the space between cell equal zero
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // this method makes the icones white when the scrolling happen (target of collection view)
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / self.MainView.frame.width
        
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        self.customPage.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: [])
        
    }
    
    
    

}

extension Slides  : ChangeTheSlidesDelegate {
        public func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        self.collectionView?.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    
    
}
// Protocol which force the target view controller to have these two methods
public protocol CustomPageControlDelegate : class {
    // How many Images do you need for custom page controll
    func numberOfShapes() -> Int
    // Give the images to slide pages
    func arrayOfImages() -> [UIImage]
    // Give the icon images to custom page controll
    func arrayOfIconImages() -> [UIImage]

}

extension Slides {
     public func setup(){
        self.customPage.backgroundColor = UIColor.clear
        self.customPage.contentView.backgroundColor = UIColor.clear
        self.customPage.collectionView.backgroundColor = UIColor.clear
        self.customPage.collectionView.selectItem(at: IndexPath(row: 3, section: 0), animated: true, scrollPosition: .left)
        self.customPage.collectionView.reloadData()
        self.customPage.collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .left)
    }
}











