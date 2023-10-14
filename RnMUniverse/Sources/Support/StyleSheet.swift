//
//  StyleSheet.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation
import UIKit
import NiceTable

public class StyleSheet {
    
    // MARK: - Public Methods
    
    public static func setup() {
        setupLargeTitle()
    }
    
    // MARK: - Private Methods
    
    private static func setupLargeTitle() {
        UINavigationBar.appearance().prefersLargeTitles = true
    }
    
}

extension CGFloat {
    
    static var characterCollectionRadius: CGFloat = 4
    static var episodeCollectionRadius: CGFloat = 4
    
}

extension NiceSectionStyle {
    
    static var hidden: NiceSectionStyle {
        var style: NiceSectionStyle = .shared
        style.isHidden = true
        return style
    }
    
}
