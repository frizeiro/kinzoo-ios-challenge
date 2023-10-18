//
//  EmptyStateAction.swift
//  NiceEmptyState
//
//  Created by Felipe Frizeiro on 01/07/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public class EmptyStateAction: EmptyStateActionRepresentable {
    
    // MARK: - Public Variables
    
    public var title: String
    public var handler: () -> ()
    
    // MARK: - Life Cycle
    
    public init(
        title: String,
        handler: @escaping () -> ()
    ) {
        self.title = title
        self.handler = handler
    }
    
}
