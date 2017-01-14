//
//  CalendarButton.swift
//  PlantCatalogue
//
//  Created by Mac on 14/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class CalendarButton: BaseCell {

    
    let calButton: UIImageView = {
        let cb = UIImageView()
        cb.image = UIImage(named: "cal.jpg")?.withRenderingMode(.alwaysTemplate)
        cb.tintColor = UIColor.rgb(red: 10, green: 120, blue: 10, alpha: 0.8)
        return cb
    }()

    override func setupViews() {
        super.setupViews()
        
        addSubview(calButton)
        addConstraintsWithFormat(format: "H:|[v0]|", views: calButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: calButton)
    }
    
    override var isHighlighted: Bool {
        didSet {
            calButton.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 10, green: 120, blue: 10, alpha: 0.8)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            calButton.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 10, green: 120, blue: 10, alpha: 0.8)
        }
    }
    
    override var isMultipleTouchEnabled: Bool {
        didSet {
            calButton.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 10, green: 120, blue: 10, alpha: 0.8)
        }
    }
    
}
