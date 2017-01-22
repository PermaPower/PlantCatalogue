//
//  SunSlider.swift
//  PlantCatalogue
//
//  Created by Mac on 17/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class SunButtonSelector: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // Setup blank dictionary with a capavary of 0-5 (Full shade..full sun) to track button presses
    var calButtonTrack = [Int:Bool](minimumCapacity: 3)
    
    // Create a collectionVvar for the buttons with multiselect enabled
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.dataSource = self
        cv.delegate = self
        cv.allowsMultipleSelection = true
        
        return cv
    }()
    
    let sunCellID = "sunCellID"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(SunButton.self, forCellWithReuseIdentifier: sunCellID)
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
    }
    
    // Sun names
    
    var sunShade = ["sun.png","partialsun.png","partialshade.png"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sunShade.count
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sunCellID, for: indexPath) as! SunButton
        
        // As this function has been casted as CalendarButton, I can access the UILabel
        cell.sunButtonImage.image = UIImage(named: sunShade[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.sunButtonImage.tintColor = Color.theme.value
        return cell
    }
    
    // detect what collectionview was selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        calButtonTrack.updateValue(true, forKey: indexPath.row)
        print (calButtonTrack)
    }
    
    // detect what collectionview was selected
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        calButtonTrack.updateValue(false, forKey: indexPath.row)
        print (calButtonTrack)
    }
    
    // Divide the collectionview by 5
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 3
        let sectionInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = frame.width  - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: (frame.height) - 2.5)
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
