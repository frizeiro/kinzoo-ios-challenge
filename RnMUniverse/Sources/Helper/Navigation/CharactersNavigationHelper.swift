//
//  CharactersNavigationHelper.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 16/10/23.
//

import Foundation
import UIKit

class CharactersNavigationHelper: BaseNavigationHelper {
    
    // MARK: - Public Methods
    
    func detail(_ character: Character) {
        let viewModel = CharacterViewModel(character: character)
        let controller = CharacterViewController(viewModel: viewModel)
        show(controller)
    }
    
}
