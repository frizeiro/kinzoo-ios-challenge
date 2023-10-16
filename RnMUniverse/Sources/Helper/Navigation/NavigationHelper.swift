//
//  NavigationHelper.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 16/10/23.
//

import Foundation

class NavigationHelper: BaseNavigationHelper {
    
    // MARK: - Public Variables
    
    var characters: CharactersNavigationHelper {
        return CharactersNavigationHelper(presentationContext)
    }
    
}
