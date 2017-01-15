//
//  CalendarButton.swift
//  PlantCatalogue
//
//  Created by Mac on 14/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class CalendarButton: BaseCell {
    
   
    let calDate: UIImageView = {
        
        let cb = UIImageView()
        cb.image = UIImage(named: "cal.jpg")?.withRenderingMode(.alwaysTemplate)
        cb.tintColor = UIColor.rgb(red: 10, green: 120, blue: 10, alpha: 0.8)
        return cb
    }()
    
    let calView: UIView = {
        
        let cv = UIView()
        cv.layer.cornerRadius = 0.15 * cv.bounds.size.width
        cv.layer.masksToBounds = true
        cv.backgroundColor = UIColor.clear
        cv.layer.borderColor = UIColor.clear.cgColor
        return cv
    }()
    
    
    override func setupViews() {
        super.setupViews()
 
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        button.layer.cornerRadius = 0.15 * button.bounds.size.width
        button.layer.borderWidth = 2.5
        button.layer.borderColor = UIColor.rgb(red: 0, green: 50, blue: 0, alpha: 0.8).cgColor
        
        button.addTarget(self, action:#selector(buttonClicked), for: .touchUpInside)

        
        addSubview(calDate)
        addConstraintsWithFormat(format: "H:|[v0]|", views: calDate)
        addConstraintsWithFormat(format: "V:|[v0]|", views: calDate)
    
        addSubview(calView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: calView)
        addConstraintsWithFormat(format: "V:[v0(10)]|", views: calView)
        
        addSubview(button)
        addConstraintsWithFormat(format: "H:|[v0]|", views: button)
        addConstraintsWithFormat(format: "V:[v0(10)]|", views: button)
        
            }
    
    
    func buttonClicked(sender: AnyObject) {
        
        if let button = sender as? UIButton {
        
            
            if (button.isSelected){
                
                calView.layer.cornerRadius = 0.15 * calView.bounds.size.width
                calView.layer.borderColor = UIColor.clear.cgColor
                calView.layer.borderWidth = 2.5
                calView.layer.masksToBounds = true
                print ("on")
                button.isSelected = false
            }
            else {
                
                calView.layer.cornerRadius = 0.15 * calView.bounds.size.width
                calView.layer.borderColor = UIColor.red.cgColor
                calView.layer.borderWidth = 2.5
                calView.layer.masksToBounds = true
                print ("off")
                button.isSelected = true
            }
      
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            calDate.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 10, green: 120, blue: 10, alpha: 0.8)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            calDate.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 10, green: 120, blue: 10, alpha: 0.8)
        }
    }
    
    override var isMultipleTouchEnabled: Bool {
        didSet {
            calDate.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 10, green: 120, blue: 10, alpha: 0.8)
        }

}
}
