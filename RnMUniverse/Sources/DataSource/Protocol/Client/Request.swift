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
    var needsToken: Bool { get }
    var runsInBackground: Bool { get }
}

extension Request {
    
    public var method: Method {
        return .get
    }
    
    public var parameters: [String: Any] {
        return [:]
    }
    
    public var headers: [String: String] {
        return [:]
    }
    
    public var cachePolicy: NSURLRequest.CachePolicy? {
        return nil
    }
    
    public var loggable: Bool {
        return true
    }
    
}
