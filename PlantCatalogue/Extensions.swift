//
//  Extensions.swift
//  PlantCatalogue
//
//  Created by Mac on 12/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

// Convenent colour
extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}


// Extension for addConstraintsWithFormat
extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...){
        
        // Enumerate views within viewsDictionary
        var viewsDictionary = [String: UIView]()
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
}

