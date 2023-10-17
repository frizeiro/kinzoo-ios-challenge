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
    
    @IBOutlet private var avatarImageView: UIImageView?
    @IBOutlet private var avatarBoxView: UIView?
    @IBOutlet private var avatarBoxBordersConstraints: [NSLayoutConstraint]?
    
    private var isBoxCentered: Bool {
        return (avatarBoxView?.frame.width ?? .infinity) < frame.width
    }
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImageView?.image = .placeholder
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        removeSeparator()
        updateBoxBorder()
        updateBoxRadius()
    }
    
    // MARK: - Public Methods
    
    override func setup(_ item: NiceTableItem) {
        guard let item = item as? CharacterHeaderItem else { return }
        
        avatarImageView?.load(from: item.avatar)
    }
    
    // MARK: - Private Methods
    
    private func removeSeparator() {
        for view in subviews where view != contentView {
            view.removeFromSuperview()
        }
    }
    
    private func updateBoxBorder() {
        let border: CGFloat = isBoxCentered ? .characterDetailBorder : 0
        
        avatarBoxBordersConstraints?.forEach {
            $0.constant = border
        }
    }
    
    private func updateBoxRadius() {
        let radius: CGFloat = isBoxCentered ? .characterDetailRadius : 0
        
        avatarBoxView?.cornerRadius = radius
        avatarImageView?.cornerRadius = radius > 0 ? radius * 0.5 : radius
    }
    
}

