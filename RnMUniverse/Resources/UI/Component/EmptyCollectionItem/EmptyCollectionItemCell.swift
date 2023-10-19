//
//  EmptyCollectionItemCell.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 18/10/23.
//

import Foundation
import NiceTable

class EmptyCollectionItemCell: NiceCollectionCell {
    
    // MARK: - Private Variables
    
    @IBOutlet private weak var imageIconView: UIImageView?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var textBodyLabel: UILabel?
    @IBOutlet private weak var actionButton: UIButton?
    
    private var actionHandler: (() -> ())?
        
    // MARK: - Public Methods
    
    override func setup(_ item: NiceCollectionItem) {
        guard let item = item as? EmptyCollectionItem else { return }
        
        imageIconView?.image = item.image
        titleLabel?.text = item.title
        textBodyLabel?.text = item.textBody
        actionButton?.setTitle(item.actionTitle, for: .normal)
        actionHandler = item.actionHandler
    }
    
    // MARK: - Private Methods
    
    // MARK: Actions
    
    @IBAction private func actionButtonTouchUpInside() {
        actionHandler?()
    }
    
}
