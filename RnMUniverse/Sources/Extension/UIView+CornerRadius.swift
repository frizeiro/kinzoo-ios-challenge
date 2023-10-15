//
//  UIView+CornerRadius.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation
import UIKit

extension UIView {
    
    // MARK: - Piblic Variables
    
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = cornerRadius > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
}
