//
//  Habit.swift
//  PlantCatalogue
//
//  Created by Mac on 19/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class HabitViewCollection: UIControl, UIPickerViewDataSource, UIPickerViewDelegate {
   
    var pickerDataSource = ["White", "Red", "Green", "Blue"]
    var pickerDataSourceImage : [UIImage] = [
        UIImage(named: "sun.png")!,
        UIImage(named: "sun.png")!,
        UIImage(named: "sun.png")!,
        UIImage(named: "sun.png")!
    ]

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
        addConstraintsWithFormat(format: "V:|-[v0]-|", views: pickerView)
    }
    
    // Mark: - PickerViewDataSource functions
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        // Change the row height of the UIPicker
        return 35
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        
        // Can adjust position of image within the UIPicker here
        let imageView = UIImageView()
		imageView.frame = CGRect(x: frame.width / 2 - 75 , y: 32, width: 40, height: 40)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
		imageView.tintColor = Color.theme.value
        imageView.image = pickerDataSourceImage[row].withRenderingMode(.alwaysTemplate)

        // Can adjust the position of the text within the UIPicker here
        let labelView = UILabel(frame: CGRect(x: 150, y: 5, width: frame.width / 2 + 50, height: frame.height))
		labelView.textColor = Color.theme.value
		
		// Color.theme.value
		labelView.text = pickerDataSource[row]
		labelView.adjustsFontSizeToFitWidth = true

        view.addSubview(imageView)
        view.addSubview(labelView)
        
        return view
    }
	
    
    // Mark: - PickerViewDelege functions
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedItemName = pickerDataSource[row]
        print(selectedItemName)
    }
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
