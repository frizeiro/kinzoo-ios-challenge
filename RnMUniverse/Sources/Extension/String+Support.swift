//
//  String+Support.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 18/10/23.
//

import Foundation

extension String {
    
    public func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
}
