//
//  ActivityMonth.swift
//  PlantCatalogue
//
//  Created by Mac on 13/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

// *** Swift is using the default 50x50 for the blue colletion view.  Need to work out correct size to fit 12 cells.
// EP 3 pos 14:32


import UIKit

class ActivityMonth: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // Create a collectionView for the buttons
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    
    let cellID = "cellID"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(CalendarButton.self, forCellWithReuseIdentifier: cellID)
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
//# MARK: - UP TO
        
        // This preselects first item in collectionView
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: .centeredHorizontally)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CalendarButton
        
        //Enable gestureRecogniser for multitouch
        
        
        cell.calButton.image = UIImage(named: "cal.jpg")?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.rgb(red: 10, green: 120, blue: 10, alpha: 0.8)
        return cell
    }
    
    // detect what collectionview was selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row + 1)
        
    }
    
    // Divide the collectionview by 6 x 2
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow: CGFloat = 6
        
        let sectionInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = frame.width  - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: (frame.height / 2) - 2.5)
    }
    
    // Reduce minimum line spacing between collectionview cells to zero
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
