//
//  Character.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation

struct Character: Codable, Equatable {
    var id: Int?
    var name: String?
    var status: CharacterStatus?
    var species: String?
    var type: String?
    var gender: CharacterGender?
    var origin: Location?
    var location: Location?
    var image: String?
    var episode: [URL]?
    var url: URL?
    var created: Date?
}

extension Character {
    
    var episodeNumbers: [Int] {
        return episode?.compactMap {
            if let number = $0.absoluteString.split(separator: "/").last {
                return Int(number)
            }
            return nil
        } ?? []
    }
    
}
