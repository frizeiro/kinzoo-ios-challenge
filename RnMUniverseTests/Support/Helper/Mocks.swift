//
//  Mocks.swift
//  RnMUniverseTests
//
//  Created by Felipe Frizeiro on 17/10/23.
//

import Foundation

class Mocks {
    
    // MARK: - Public Variables
    
    static var bundle = Bundle(for: Mocks.self)
    
    // MARK: - Public Methods
    
    class func loadString(
        _ fileName: String,
        type: String = "json",
        bundle: Bundle = bundle
    ) -> String {
        let data = loadData(fileName, type: type, bundle: bundle)
        return String(data: data, encoding: .utf8)!
    }
    
    class func loadData(
        _ fileName: String,
        type: String = "json",
        bundle: Bundle = bundle
    ) -> Data {
        let name = fileName.replacingOccurrences(of: ".json", with: "")
        guard let path = bundle.path(forResource: name, ofType: type) else {
            fatalError("Mock \"\(fileName)\" not foud.")
        }
        return try! Data(contentsOf: URL(fileURLWithPath: path))
    }
    
}
