//
//  UIImage+Resources.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 15/10/23.
//

import Foundation
import UIKit

extension UIImage {
    
    struct system {
        
        // MARK: - Public Variables
        
        static let person_fill_viewfinder = systemName("person.fill.viewfinder")
        static let photo = systemName("photo")
        
    }
    
    struct custom {
        
        // MARK: - Public Variables
        
        static let placeholder = named("placeholder")
        
    }
    
    // MARK: - Private Methods
    
    private static func systemName(_ systemName: String) -> UIImage {
        UIImage(systemName: systemName)!
    }
    
    private static func named(_ named: String) -> UIImage {
        UIImage(named: named)!
    }
    
}
