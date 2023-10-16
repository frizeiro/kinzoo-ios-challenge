//
//  UIViewController+NavigationHelper.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 16/10/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    // MARK: - Public Variables
    
    var navigationHelper: NavigationHelper {
        return NavigationHelper(self)
    }
    
}
