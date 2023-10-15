//
//  CharacterCollectionItem.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation
import NiceTable

class CharacterCollectionItem: NiceCollectionItem {
    
    // MARK: - Public Variables
    
    override var cellType: NiceCollectionCell.Type {
        return CharacterCollectionItemCell.self
    }
    
    var name: String {
        return character.name
    }
    
    var avatar: String {
        return character.image
    }
    
    var placeholder: UIImage {
        return .placeholder
    }
    
    // MARK: - Private Variables
    
    private var character: Character
    
    // MARK: - Life Cycle
    
    init(_ character: Character) {
        self.character = character
    }
    
}
