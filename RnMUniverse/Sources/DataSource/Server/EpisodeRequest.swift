//
//  EpisodeRequest.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 18/10/23.
//

import Foundation

enum EpisodeRequest: Request {
    
    case detail(ids: [Int])
    
    // MARK: - Public Variables
    
    var path: String {
        switch self {
            case .detail(let id):
                return "character/\(id.joined(","))"
        }
    }
    
    var parameters: [String : Any] {
        return [:]
    }
    
    var method: Method {
        return .get
    }
    
}
