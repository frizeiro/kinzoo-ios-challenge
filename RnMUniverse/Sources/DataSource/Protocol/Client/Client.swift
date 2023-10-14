//
//  Client.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation
import PromiseKit

protocol Client: AnyObject {
    
    var baseUrl: String { get }
    
    func execute<T>(_ request: Request) -> Promise<T> where T: Decodable
    func cancellableExecute<T>(_ request: Request) -> (promise: Promise<T>, cancelHandler: (() -> Void)?) where T: Decodable
    
}
