//
//  CharacterRequest.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation

enum CharacterRequest: Request {
    
    case fetch(page: Int, name: String?)
    case detail(id: Int)
    
    // MARK: - Public Variables
    
    var path: String {
        switch self {
            case .fetch(_, _):
                return "character"
            case .detail(let id):
                return "character/\(id)"
        }
    }
    
    var parameters: [String : Any] {
        switch self {
            case .fetch(let page, let name):
                return ["page": page, "name": name]
            case .detail(_):
                return [:]
        }
    }
    
    var method: Method {
        return .get
    }
    
}
