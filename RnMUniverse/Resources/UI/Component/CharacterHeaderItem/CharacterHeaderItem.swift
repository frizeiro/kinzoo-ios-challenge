//
//  CharacterHeaderItem.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 16/10/23.
//

import Foundation
import NiceTable

class CharacterHeaderItem: NiceTableItem {
    
    // MARK: - Public Variables
    
    open override var cellType: NiceTableCell.Type {
        return CharacterHeaderItemCell.self
    }
    
    var avatar: String {
        return character.image
    }
    
    // MARK: - Private Variables
    
    private var character: Character
    
    // MARK: - Life Cycle
    
    init(_ character: Character) {
        self.character = character
    }
    
}
