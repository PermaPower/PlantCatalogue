//
//  ColorScheme.swift
//  PlantCatalogue
//
//  Created by Mac on 17/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

// Usage Examples
// let shadowColor = Color.shadow.value
// let shadowColorWithAlpha = Color.shadow.withAlpha(0.5)
// let customColorWithAlpha = Color.custom(hexString: "#123edd", alpha: 0.25).value

enum Color {
    
    case theme
    case border
    case shadow
    
    case darkBackground
    case lightBackground
    case intermidiateBackground
    
    case darkText
    case lightText
    case intermidiateText
    
    case affirmation
    case negation
    
    case custom(hexString: String, alpha: Double)
    
    func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}

