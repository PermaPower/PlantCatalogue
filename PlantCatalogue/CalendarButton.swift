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
        
        cb.layer.borderColor = Color.affirmation.withAlpha(0.9).cgColor
        cb.layer.borderWidth = 2.0
        cb.layer.cornerRadius = 5
        cb.layer.masksToBounds = true
        
        return cb
        
    }()
    
    let calButtonMonth: UILabel = {
        
        let cbm = UILabel()
        
        cbm.textAlignment = .center
        cbm.textColor = Color.lightBackground.withAlpha(0.8)
        cbm.sizeToFit()
        
        return cbm
        
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(calButtonMonth)
        addConstraintsWithFormat(format: "H:|[v0]|", views: calButtonMonth)
        addConstraintsWithFormat(format: "V:|[v0(30)]", views: calButtonMonth)
        
        addSubview(calButton)
        addConstraintsWithFormat(format: "H:|[v0]|", views: calButton)
        addConstraintsWithFormat(format: "V:[v0(10)]|", views: calButton)
        
    }
    
    override var isHighlighted: Bool {
        didSet {
            calButton.backgroundColor = isHighlighted ? Color.negation.value: UIColor.clear
        }
    }
    
    override var isSelected: Bool {
        didSet {
            calButton.backgroundColor = isSelected ? Color.negation.value: UIColor.clear
        }
    }
    
    override var isMultipleTouchEnabled: Bool {
        didSet {
            calButton.backgroundColor = isMultipleTouchEnabled ? Color.negation.value: UIColor.clear
        }
    }
}
