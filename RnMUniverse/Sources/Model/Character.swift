//
//  Character.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation

struct Character: Codable {
    var id: Int
    var name: String
    var status: CharacterStatus
    var species: String
    var type: String
    var gender: CharacterGender
    var origin: Origin
    var location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: Date
}
