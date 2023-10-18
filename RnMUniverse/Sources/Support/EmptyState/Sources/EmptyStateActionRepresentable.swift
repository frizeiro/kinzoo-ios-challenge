//
//  EmptyStateActionRepresentable.swift
//  NiceEmptyState
//
//  Created by Felipe Frizeiro on 01/07/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public protocol EmptyStateActionRepresentable {
    
    var title: String { get }
    var handler: () -> () { get set }
    
}
