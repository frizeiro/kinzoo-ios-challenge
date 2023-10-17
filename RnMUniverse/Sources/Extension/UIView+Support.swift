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
        alpha: CGFloat = 1,
        reducedTransparencyColor: UIColor = .white
    ) {
        if !UIAccessibility.isReduceTransparencyEnabled {
            backgroundColor = .clear
            
            let blurEffect = UIBlurEffect(style: style)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            
            blurEffectView.frame = bounds
            blurEffectView.alpha = alpha
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            if layer.cornerRadius > 0 {
                blurEffectView.layer.cornerRadius = layer.cornerRadius
                blurEffectView.layer.masksToBounds = true
            }
            
            insertSubview(blurEffectView, at: 0)
        } else {
            backgroundColor = reducedTransparencyColor
        }
    }
    
}
