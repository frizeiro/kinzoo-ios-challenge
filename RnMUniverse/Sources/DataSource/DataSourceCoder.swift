//
//  DataSourceCoder.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 17/10/23.
//

import Foundation

class DataSourceCoder: DataSourceSerializer {
    
    // MARK: - Public Methods
    
    public static let shared = DataSourceCoder()
    
    public let encoder = JSONEncoder()
    public let decoder = JSONDecoder()
    
    // MARK: - Life Cycle
    
    public init() {
        encoder.dateEncodingStrategy = .formatted(.standardZ)
        decoder.dateDecodingStrategy = .formatted(.standardZ)
    }
    
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
        return try decoder.decode(type, from: data)
    }
    
    func encode<T>(_ value: T) throws -> Data where T : Encodable {
        return try encoder.encode(value)
    }
    
}
