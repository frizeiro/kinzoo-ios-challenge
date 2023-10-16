//
//  CharacterHeaderItemCell.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 16/10/23.
//

import Foundation
import NiceTable

class CharacterHeaderItemCell: NiceTableCell {
    
    // MARK: - Private Variables
    
    @IBOutlet private var avatarImage: UIImageView?
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImage?.image = .placeholder
    }
    
    // MARK: - Public Methods
    
    override func setup(_ item: NiceTableItem) {
        guard let item = item as? CharacterHeaderItem else { return }
        
        avatarImage?.load(from: item.avatar)
    }
    
}

