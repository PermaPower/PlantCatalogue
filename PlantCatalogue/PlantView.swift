//
//  PlantView.swift
//  PlantCatalogue
//
//  Created by Mac on 13/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

//# MARK: - PlantCell class

// Activity Month view Class (Type BaseCell - cleaner)
class PlantCell: BaseCell {
    
    // Activity Month Background View
    let activityMonthView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.theme.withAlpha(0.2)
        return view
    }()
    
    // Sun Background View
    let sunMonthView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.theme.withAlpha(0.2)
        return view
    }()
    
    // Sun icon View
    let sunIconView: WeatherIcon = {
        let sunIcon = WeatherIcon()
        return sunIcon
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
    
    // Sun Slider
    let sunSelector: SunButtonSelector = {
        let sun = SunButtonSelector()
        return sun
    }()
    
    // UIpicker for habit
    let habitPicker: HabitViewCollection = {
        
        let habit = HabitViewCollection()
        return habit
    }()
    
    // Seperator line
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.theme.withAlpha(0.2)
        return view
    }()
    
    // Overrided as it uses the baseCell superclass
    override func setupViews() {
        
        // Add subviews
        addSubview(activityMonthView)
        addSubview(sunMonthView)
        addSubview(actMonthCal)
        addSubview(sunIconView)
        addSubview(separatorView)
        addSubview(actMonth)
        addSubview(sunSelector)
        addSubview(habitPicker)

        
        // Horizontal constraints
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: activityMonthView)
        addConstraintsWithFormat(format: "H:|-28-[v0(50)]", views: actMonthCal)
        addConstraintsWithFormat(format: "H:|-92-[v0]-32-|", views: actMonth)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: sunMonthView)
        addConstraintsWithFormat(format: "H:|-92-[v0]-32-|", views: sunSelector)
        addConstraintsWithFormat(format: "H:|-28-[v0(50)]", views: sunIconView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]", views: habitPicker)
               
        addConstraintsWithFormat(format: "H:|-[v0]-|", views: separatorView)
        
        // Vertical constraints
        addConstraintsWithFormat(format: "V:|-16-[v0(130)]", views: activityMonthView)
        addConstraintsWithFormat(format: "V:|-54-[v0(50)]", views: actMonthCal)
        addConstraintsWithFormat(format: "V:|-32-[v0(85)]", views: actMonth)
        
        addConstraintsWithFormat(format: "V:|-150-[v0(80)]", views: sunMonthView)
        addConstraintsWithFormat(format: "V:|-165-[v0(50)]", views: sunSelector)
        addConstraintsWithFormat(format: "V:|-165-[v0(50)]", views: sunIconView)
        
        addConstraintsWithFormat(format: "V:|-250-[v0(100)]", views: habitPicker)
        
        addConstraintsWithFormat(format: "V:[v0(1)]|", views: separatorView)
        

    }
    
   
}
