//
//  Episode.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 18/10/23.
//

import Foundation

struct Episode: Codable, Equatable {
    var id: Int?
    var name: String?
    var air_date: String?
    var episode: String?
    var characters: [URL]?
    var url: URL?
    var created: Date?
}
