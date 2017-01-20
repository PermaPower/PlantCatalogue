//
//  Habit.swift
//  PlantCatalogue
//
//  Created by Mac on 19/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class HabitViewCollection: UIControl, UIPickerViewDataSource, UIPickerViewDelegate {
   
    var pickerDataSource = ["White", "Red", "Green", "Blue"];

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        let pickerView: UIPickerView = {
            let pv = UIPickerView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            pv.dataSource = self
            pv.delegate = self
            pv.translatesAutoresizingMaskIntoConstraints = false
            return pv
        }()
        
        addSubview(pickerView)
        addConstraintsWithFormat(format: "H:|-[v0]-|", views: pickerView)
        addConstraintsWithFormat(format: "V:|-[v0(50)]", views: pickerView)
        

        //backgroundColor = tintColor
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
