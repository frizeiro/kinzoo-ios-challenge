//
//  DataSourceSerializer.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 17/10/23.
//

import Foundation

protocol DataSourceSerializer {
    
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
    func encode<T>(_ value: T) throws -> Data where T : Encodable
    
}
