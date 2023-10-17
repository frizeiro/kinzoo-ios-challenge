//
//  CharacterStatus.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation

enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

extension CharacterStatus {
    
    var name: String {
        return .localized(rawValue.lowercased())
    }
    
}
