//
//  EmptyStateRepresentable.swift
//  NiceEmptyState
//
//  Created by Felipe Frizeiro on 01/07/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public protocol EmptyStateRepresentable {
    
    var identifier: String { get }
    var image: UIImage? { get }
    var title: String? { get }
    var text: String? { get }
    var action: EmptyStateActionRepresentable? { get set }
    var shouldDisplayHandler: () -> Bool { get set }
    
}
