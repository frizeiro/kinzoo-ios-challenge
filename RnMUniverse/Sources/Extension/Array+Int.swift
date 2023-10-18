//
//  Array+Int.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 18/10/23.
//

import Foundation

extension Array where Element == Int {
    
    public func joined(_ separator: String = "") -> String {
        map { $0.description }.joined(separator: separator)
    }
    
}
