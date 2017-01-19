//
//  WeatherIcon.swift
//  PlantCatalogue
//
//  Created by Mac on 19/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class WeatherIcon: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let weatherView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "umbrella.png")?.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = Color.lightBackground.withAlpha(0.8)
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            return imageView
        }()
        
        addSubview(weatherView)
        addConstraintsWithFormat(format: "H:|-[v0]-|", views: weatherView)
        addConstraintsWithFormat(format: "V:|-[v0]-|", views: weatherView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
