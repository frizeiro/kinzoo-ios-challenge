//
//  Request.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation

protocol Request {
    var path: String { get }
    var method: Method { get }
    var parameters: [String: Any] { get }
    var headers: [String: String] { get }
    var cachePolicy: NSURLRequest.CachePolicy? { get }
    var loggable: Bool { get }
}

extension Request {
    
    var method: Method {
        return .get
    }
    
    var parameters: [String: Any] {
        return [:]
    }
    
    var headers: [String: String] {
        return [:]
    }
    
    var cachePolicy: NSURLRequest.CachePolicy? {
        return nil
    }
    
    var loggable: Bool {
        return true
    }
    
}
