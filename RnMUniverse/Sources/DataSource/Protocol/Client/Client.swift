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
    
    func execute<T: Decodable>(_ request: Request) -> Promise<T>
    
}
