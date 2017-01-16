//
//  ActivityMonthCalendar.swift
//  PlantCatalogue
//
//  Created by Mac on 13/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//


// Activity Month Calendar icon

import UIKit

class ActivityMonthCal: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let calendarView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "cal.jpg")?.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = UIColor.rgb(red: 0, green: 120, blue: 0, alpha: 0.8)
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            return imageView
    }()
        
        addSubview(calendarView)
        addConstraintsWithFormat(format: "H:|-[v0]-|", views: calendarView)
        addConstraintsWithFormat(format: "V:|-[v0]-|", views: calendarView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
