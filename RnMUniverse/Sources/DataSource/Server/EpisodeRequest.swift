//
//  EpisodeRequest.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 18/10/23.
//

import Foundation

enum EpisodeRequest: Request {
    
    case detail(id: Int)
    case detailMany(ids: [Int])
    
    // MARK: - Public Variables
    
    var path: String {
        switch self {
            case .detail(let id):
                return "episode/\(id)"
            case .detailMany(ids: let ids):
                return "episode/[\(ids.joined(","))]"
        }
    }
    
    var parameters: [String : Any] {
        return [:]
    }
    
    var method: Method {
        return .get
    }
    
}
