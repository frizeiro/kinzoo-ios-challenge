//
//  EmptyStateBackgroundView.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 18/10/23.
//

import Foundation
import UIKit

protocol EmptyStateBackgroundView where Self: UIScrollView {
    var backgroundView: UIView? { get set }
}

extension UITableView: EmptyStateBackgroundView {}
extension UICollectionView: EmptyStateBackgroundView {}

extension EmptyStateBackgroundView {
    
    var safeBackgroundView: UIView {
        if let backgroundView {
            return backgroundView
        } else {
            backgroundView = UIView()
            return backgroundView!
        }
    }
    
}
