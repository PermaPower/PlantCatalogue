//
//  BaseCell.swift
//  PlantCatalogue
//
//  Created by Mac on 15/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

// Superclass to initalise all base UICollectionView cells
class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        // When dequeueReusableCell is called this init method is called if it needs a new cell
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
