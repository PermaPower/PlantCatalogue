//
//  PlantView.swift
//  PlantCatalogue
//
//  Created by Mac on 13/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

// Superclass to initalise all base UICollectionView cells
class BaseCell: UICollectionViewCell  {
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

//# MARK: - PlantCell class

// Activity Month view Class (Type BaseCell - cleaner)
class PlantCell: BaseCell {
    
    // Activity Month Background View
    let activityMonthView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 42, green: 83, blue: 31, alpha: 0.2)
        return view
    }()
    
    // Activity Month Calendar View
    let actMonthCal: ActivityMonthCal = {
        let amc = ActivityMonthCal()
        return amc
    }()
    
    // Activity Month cell
    let actMonth: ActivityMonth = {
        let am = ActivityMonth()
        return am
    }()
    
    // Seperator line
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 42, green: 83, blue: 31, alpha: 0.2)
        return view
    }()
    
    // Overrided as it uses the baseCell superclass
    override func setupViews() {
        
        // Add subviews
        addSubview(activityMonthView)
        addSubview(actMonthCal)
        addSubview(separatorView)
        addSubview(actMonth)
        
        // Horizontal constraints
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: activityMonthView)
        addConstraintsWithFormat(format: "H:|-28-[v0(50)]", views: actMonthCal)
        addConstraintsWithFormat(format: "H:|-[v0]-|", views: separatorView)
        addConstraintsWithFormat(format: "H:|-92-[v0]-32-|", views: actMonth)
        
        // Vertical constraints
        addConstraintsWithFormat(format: "V:|-16-[v0]-64-|", views: activityMonthView)
        addConstraintsWithFormat(format: "V:|-54-[v0(50)]", views: actMonthCal)
        addConstraintsWithFormat(format: "V:[v0(1)]|", views: separatorView)
        addConstraintsWithFormat(format: "V:|-32-[v0(88)]", views: actMonth)
    }
    
   
}
