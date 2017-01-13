//
//  ActivityMonth.swift
//  PlantCatalogue
//
//  Created by Mac on 13/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

// *** Swift is using the default 50x50 for the blue colletion view.  Need to work out correct size to fit 12 cells.


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
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        cell.backgroundColor = UIColor.blue
        
        return cell
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
