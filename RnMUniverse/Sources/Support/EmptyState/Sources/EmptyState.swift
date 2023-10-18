//
//  EmptyState.swift
//  NiceEmptyState
//
//  Created by Felipe Frizeiro on 01/07/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public class EmptyState: EmptyStateRepresentable {
    
    // MARK: - Public Variables
    
    public let identifier = UUID().uuidString
    
    public var image: UIImage?
    public var title: String?
    public var text: String?
    public var action: EmptyStateActionRepresentable?
    public var shouldDisplayHandler: () -> Bool
    
    // MARK: - Life Cycle
    
    public init(
        image: UIImage? = nil,
        title: String? = nil,
        text: String? = nil,
        action: EmptyStateActionRepresentable? = nil,
        shouldDisplayHandler: @escaping () -> Bool
    ) {
        self.image = image
        self.title = title
        self.text = text
        self.action = action
        self.shouldDisplayHandler = shouldDisplayHandler
    }
    
}

