//
//  EmptyCollectionItem.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 18/10/23.
//

import Foundation
import NiceTable

class EmptyCollectionItem: NiceCollectionItem {
    
    // MARK: - Public Variables
    
    open override var cellType: NiceCollectionCell.Type {
        return EmptyCollectionItemCell.self
    }
    
    override var size: NiceCollectionItemSize? {
        .dynamicProportionalMax(itemsPerRow: 1, proportionalHeight: 0.5, maxHeight: 200)
    }
    
    var image: UIImage? {
        return emptyState.image
    }
    
    var title: String? {
        return emptyState.title
    }
    
    var textBody: String? {
        return emptyState.text
    }
    
    var actionTitle: String? {
        return emptyState.action?.title
    }
    
    var actionHandler: (() -> ())? {
        return emptyState.action?.handler
    }
    
    // MARK: - Private Variables
    
    private var emptyState: EmptyState
    
    // MARK: - Life Cycle
    
    init(_ emptyState: EmptyState) {
        self.emptyState = emptyState
    }
    
}

