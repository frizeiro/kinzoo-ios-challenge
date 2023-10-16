//
//  CharacterCollectionItemCell.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation
import NiceTable

class CharacterCollectionItemCell: NiceCollectionCell {
    
    // MARK: - Private Variables
    
    @IBOutlet private var nameLabel: UILabel?
    @IBOutlet private var avatarImage: UIImageView?
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.cornerRadius = .characterCollectionRadius
        avatarImage?.image = .placeholder
    }
    
    // MARK: - Methods
    
    override func setup(_ item: NiceCollectionItem) {
        guard let item = item as? CharacterCollectionItem else { return }
        
        nameLabel?.text = item.name
        avatarImage?.load(from: item.avatar)
    }
    
}
