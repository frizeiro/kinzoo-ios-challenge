//
//  Expects.swift
//  RnMUniverseTests
//
//  Created by Felipe Frizeiro on 17/10/23.
//

import Foundation
import Nimble

func expectCodable<T>(
    _ type: T.Type,
    file: FileString = #file,
    line: UInt = #line
) where T : Codable & Equatable {
    let modelA = fromMock(type)
    
    let dataA = modelA.encoded()!
    let modelC = dataA.decoded(type)
        
    expect(file: file, line: line, modelA) == modelC
}
