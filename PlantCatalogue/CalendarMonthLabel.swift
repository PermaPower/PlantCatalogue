//
//  CalendarMonthLabel.swift
//  PlantCatalogue
//
//  Created by Mac on 16/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class CalendarMonthLabel: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "AAA"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.sizeToFit()
            label.textColor = UIColor.white
            return label
        }()
        
        func setupViews() {
            
            addSubview(nameLabel)
            addConstraintsWithFormat(format: "H:|-[v0]-|", views: nameLabel)
            addConstraintsWithFormat(format: "V:|-[v0]-|", views: nameLabel)
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
