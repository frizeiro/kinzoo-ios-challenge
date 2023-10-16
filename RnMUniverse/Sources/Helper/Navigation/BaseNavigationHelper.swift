//
//  BaseNavigationHelper.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 16/10/23.
//

import Foundation
import UIKit

class BaseNavigationHelper {
    
    // MARK: - Public Variables
    
    private(set) weak var presentationContext: UIViewController!
    
    // MARK: - Life Cycle
    
    init(_ presentationContext: UIViewController) {
        self.presentationContext = presentationContext
    }
    
    // MARK: - Public Methods
    
    func show(_ controller: UIViewController) {
        presentationContext.show(controller, sender: nil)
    }
    
    func showDetail(_ controller: UIViewController) {
        let navController = UINavigationController(rootViewController: controller)
        presentationContext.showDetailViewController(navController, sender: nil)
    }
    
}
