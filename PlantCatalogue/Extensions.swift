//
//  Extensions.swift
//  PlantCatalogue
//
//  Created by Mac on 12/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

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


// Extension to convert Hex to RGB with alpha
extension Color {
    
     /*
     Theme Colour:              Colours on Navigation Bar, Button Titles, Progress Indicator etc.
     Border Colour:             Hair line separators in between views.
     Shadow Colour:             Shadow colours for card like design.
     Dark Background Colour:    Dark background colour to group UI components with light colour.
     Light Background Colour:   Light background colour to group UI components with dark colour.
     Intermediate Backgrd Col:  Used for grouping UI elements with some other colour scheme.
     Dark Text Colour:
     Light Text Colour:
     Intermediate Text Colour:
     Affirmation:               Colour to show success, something right for user.
     Negation:                  Colour to show error, some danger zones for user.
     
     https://material.io/guidelines/style/color.html#color-color-palette
     */
    
    var value: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {
        case .border:
            instanceColor = UIColor(hexString: "#333333")
        case .theme:
            instanceColor = UIColor(hexString: "#388E3C")
        case .shadow:
            instanceColor = UIColor(hexString: "#ccccc")
        case .darkBackground:
            instanceColor = UIColor(hexString: "#2E7D32")
        case .lightBackground:
            instanceColor = UIColor(hexString: "#1B5E20")
        case .intermidiateBackground:
            instanceColor = UIColor(hexString: "#cccc99")
        case .darkText:
            instanceColor = UIColor(hexString: "#64706c")
        case .intermidiateText:
            instanceColor = UIColor(hexString: "#999999")
        case .lightText:
            instanceColor = UIColor(hexString: "#FFFFFF")
        case .affirmation:
            instanceColor = UIColor(hexString: "#E8F5E9")
        case .negation:
            instanceColor = UIColor(hexString: "#000000")
        case .custom(let hexValue, let opacity):
            instanceColor = UIColor(hexString: hexValue).withAlphaComponent(CGFloat(opacity))
        }
        return instanceColor
    }
}

extension UIColor {
    /**
     Creates an UIColor from HEX String in "#363636" format
     
     - parameter hexString: HEX String in "#363636" format
     
     - returns: UIColor from HexString
     */
    convenience init(hexString: String) {
        
        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner          = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
}
