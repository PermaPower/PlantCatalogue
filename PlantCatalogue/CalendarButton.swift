//
//  CalendarButton.swift
//  PlantCatalogue
//
//  Created by Mac on 14/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class CalendarButton: BaseCell {
    
    let calButton: UIView = {
        
        let cb = UIView()
        
        cb.layer.borderColor = UIColor.rgb(red: 10, green: 120, blue: 10, alpha: 0.9).cgColor
        cb.layer.borderWidth = 2.0
        cb.layer.cornerRadius = 5
        cb.layer.masksToBounds = true
        
        return cb
        
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(calButton)
        addConstraintsWithFormat(format: "H:|[v0]|", views: calButton)
        addConstraintsWithFormat(format: "V:[v0(10)]|", views: calButton)
    }
    
    override var isHighlighted: Bool {
        didSet {
            calButton.backgroundColor = isHighlighted ? UIColor.red: UIColor.clear
        }
    }
    
    override var isSelected: Bool {
        didSet {
            calButton.backgroundColor = isSelected ? UIColor.red: UIColor.clear
        }
    }
    
    override var isMultipleTouchEnabled: Bool {
        didSet {
            calButton.backgroundColor = isMultipleTouchEnabled ? UIColor.red: UIColor.clear
        }
    }
}
