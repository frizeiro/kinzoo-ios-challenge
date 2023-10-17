//
//  UIViewController+Loader.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 16/10/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    // MARK: - Public Variables
    
    @objc open var hasLoader: Bool {
        return view.hasLoader
    }
    
    @objc open func showLoader() {
        view.showLoader()
    }
    
    @objc open func hideLoader(forcing: Bool = false) {
        return view.hideLoader(forcing: forcing)
    }
    
}
