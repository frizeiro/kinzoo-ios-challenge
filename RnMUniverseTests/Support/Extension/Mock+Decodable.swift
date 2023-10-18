//
//  Mock+Decodable.swift
//  RnMUniverseTests
//
//  Created by Felipe Frizeiro on 17/10/23.
//

import Foundation

@testable import RnMUniverse

extension Decodable {
    
    // MARK: - Public Variables
    
    static func fromMock() -> Self {
        let name = "\(String(describing: self))_Mock"
        let data = Mocks.loadData(name)
        return data.decoded(Self.self)!
    }
    
    static func fromEmptyMock() -> Self {
        let data = "{}".data(using: .utf8)!
        return data.decoded(Self.self)!
    }
    
}

func fromMock<T: Decodable>(_ type: T.Type) -> T  {
    return type.fromMock()
}

func fromEmptyMock<T: Decodable>(_ type: T.Type) -> T  {
    return type.fromEmptyMock()
}
