//
//  SunButton.swift
//  PlantCatalogue
//
//  Created by Mac on 17/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

//
//  CalendarButton.swift
//  PlantCatalogue
//
//  Created by Mac on 14/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class SunButton: BaseCell {
    
    let sunButtonImage: UIImageView = {
        
        let cb = UIImageView()        
        return cb
        
    }()

    
    override func setupViews() {
        super.setupViews()
        
        
        
        addSubview(sunButtonImage)
        addConstraintsWithFormat(format: "H:|[v0]|", views: sunButtonImage)
        addConstraintsWithFormat(format: "V:|[v0]|", views: sunButtonImage)

        
    }
    
    override var isHighlighted: Bool {
        didSet {
            sunButtonImage.backgroundColor = isHighlighted ? UIColor.red: UIColor.clear
        }
    }
    
    override var isSelected: Bool {
        didSet {
            sunButtonImage.backgroundColor = isSelected ? UIColor.red: UIColor.clear
        }
    }
    
    override var isMultipleTouchEnabled: Bool {
        didSet {
            sunButtonImage.backgroundColor = isMultipleTouchEnabled ? UIColor.red: UIColor.clear
        }
    }
}

