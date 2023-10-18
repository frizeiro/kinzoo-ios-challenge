//
//  Codable+Support.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 17/10/23.
//

import Foundation

extension Encodable {
    
    public func encoded() -> Data? {
        return try? DataSourceCoder.shared.encode(self)
    }
    
}

extension Data {
    
    public func decoded<T: Decodable>(_ type: T.Type) -> T? {
        return try? DataSourceCoder.shared.decode(type, from: self)
    }
    
}
