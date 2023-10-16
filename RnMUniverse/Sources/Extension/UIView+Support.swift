//
//  UIView+Support.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation
import UIKit

extension UIView {
    
    // MARK: - Public Variables
    
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = cornerRadius > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    // MARK: - Public Methods
    
    func applyBlur(
        _ style: UIBlurEffect.Style = .light,
        reducedTransparencyColor: UIColor = .white
    ) {
        if !UIAccessibility.isReduceTransparencyEnabled {
            backgroundColor = .clear
            
            let blurEffect = UIBlurEffect(style: style)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            
            blurEffectView.frame = bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            insertSubview(blurEffectView, at: 0)
        } else {
            backgroundColor = reducedTransparencyColor
        }
    }
    
}
