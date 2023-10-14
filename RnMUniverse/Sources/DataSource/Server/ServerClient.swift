//
//  ServerClient.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation
import PromiseKit

final class ServerClient: Client {
    
    // MARK: - Public Variables
    
    private(set) var baseUrl: String
    
    // MARK: - Life Cycle
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    // MARK: - Public Methods
    
    func execute<T>(_ request: Request) -> Promise<T> where T : Decodable {
        Promise<T> { resolver in
            log(request)
            
            var urlRequest: URLRequest?
            do {
                urlRequest = try self.urlRequest(request)
            } catch {
                resolver.reject(NetworkError.parameterizingFailed(error))
            }
            
            URLSession.shared.dataTask(with: urlRequest!) { [weak self] data, response, error in
                
                if let error {
                    resolver.reject(error)
                    return
                }
                
                guard let data else {
                    resolver.reject(NetworkError.emptyResponse)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(.standardZ)
                    
                    self?.log(request, data)
                    
                    let responseObject = try decoder.decode(T.self, from: data)
                    resolver.fulfill(responseObject)
                } catch {
                    resolver.reject(NetworkError.encodingFailed(error))
                }
            }.resume()
        }
    }
    
}

extension ServerClient {
    
    private func requestPath(_ request: Request) -> String {
        return "\(baseUrl)/\(request.path)"
    }
    
    private func urlRequest(_ request: Request) throws -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: requestPath(request))!)
        urlRequest.httpMethod = request.method.rawValue
        
        urlRequest.applyCache(request)
        urlRequest.applyHeaders(request)
        try urlRequest.applyBody(request)
        
        return urlRequest
    }
    
}

extension ServerClient {
    
    private func log(_ request: Request) {
        #if DEBUG
        guard request.loggable else { return }
        print("[ServerClient]: Request  \(request.method.rawValue) \(requestPath(request))")
        #endif
    }
    
    private func log(_ request: Request, _ result: Data? = nil) {
        #if DEBUG
        guard request.loggable else { return }
        
        let response = result?.prettyPrintedJSONString ?? "-- empty body --"
        
        print("[ServerClient]: Response \(request.method.rawValue) \(requestPath(request))\n\(response)")
        #endif
    }
    
}

extension URLRequest {
    
    fileprivate mutating func applyCache(_ request: Request) {
        if let requestPolicy = request.cachePolicy {
            cachePolicy = requestPolicy
        } else {
            if NetworkManager.shared.isConnected {
                cachePolicy = .reloadIgnoringLocalCacheData
            } else {
                cachePolicy = .returnCacheDataElseLoad
            }
        }
    }
    
    fileprivate mutating func applyBody(_ request: Request) throws {
        guard request.method == .post else { return }
        
        let data = try JSONSerialization.data(withJSONObject: request.parameters, options: [])
        
        if value(forHTTPHeaderField: "Content-Type") == nil {
            setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        httpBody = data
    }
    
    fileprivate mutating func applyHeaders(_ request: Request) {
        request.headers.forEach { (key, value) in
            addValue(value, forHTTPHeaderField: key)
        }
    }
    
}
