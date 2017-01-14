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
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    let imageIconMonth = ["cal.jpg", "cal.jpg"]
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        cell.backgroundColor = UIColor.rgb(red: 58, green: 153, blue: 68, alpha: 0.8)
        
        // cell.backgroundView = UIImageView.init(image: (UIImage(named: "cal.jpg")), highlightedImage: UIImage(named: "cal.jpg"))
        
        return cell
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
