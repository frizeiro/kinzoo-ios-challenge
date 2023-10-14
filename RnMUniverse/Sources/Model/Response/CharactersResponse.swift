//
//  CharactersResponse.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation

struct CharactersResponse: Codable {
    var info: Info
    var results: [Character]
}
