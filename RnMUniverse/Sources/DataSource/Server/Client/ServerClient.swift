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
    private(set) var serializer: DataSourceSerializer
    
    // MARK: - Life Cycle
    
    init(
        baseUrl: String,
        serializer: DataSourceSerializer
    ) {
        self.baseUrl = baseUrl
        self.serializer = serializer
    }
    
    // MARK: - Public Methods
    
    func execute<T>(_ request: Request) -> Promise<T> where T : Decodable {
        Promise<T> { resolver in
            var urlRequest: URLRequest?
            do {
                defer {
                    self.log(request, urlRequest)
                }
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
                
                self?.log(request, urlRequest, data)
                
                let errorObject = try? self?.serializer.decode(ErrorResponse.self, from: data)
                
                if let errorObject {
                    resolver.reject(NetworkError.requestError(errorObject))
                    return
                }
                
                do {
                    let responseObject = try self!.serializer.decode(T.self, from: data)
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
        
        urlRequest.applyCachePolicy(request)
        urlRequest.applyHeaders(request)
        urlRequest.applyQuery(request)
        try urlRequest.applyBody(request)
        
        return urlRequest
    }
    
}

extension ServerClient {
    
    private func log(
        _ request: Request,
        _ urlRequest: URLRequest?
    ) {
        #if DEBUG
        guard request.loggable else { return }
        print("[ServerClient]: Request  \(logRequestDescription(request, urlRequest))")
        #endif
    }
    
    private func log(
        _ request: Request,
        _ urlRequest: URLRequest?,
        _ result: Data? = nil
    ) {
        #if DEBUG
        guard request.loggable else { return }
        
        let response = result?.prettyPrintedJSONString ?? "-- empty body --"
        
        print("[ServerClient]: Response \(logRequestDescription(request, urlRequest))\n\(response)")
        #endif
    }
    
    private func logRequestDescription(
        _ request: Request,
        _ urlRequest: URLRequest?
    ) -> String {
        return "\(request.method.rawValue) \(urlRequest?.url?.absoluteString ?? requestPath(request))"
    }
        
}

extension URLRequest {
    
    fileprivate mutating func applyCachePolicy(_ request: Request) {
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
    
    fileprivate mutating func applyQuery(_ request: Request) {
        guard
            request.method == .get,
            request.parameters.count > 0,
            let url
        else { return }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        let queryItems = request.parameters.map {
            URLQueryItem(name: $0, value: ($1 as AnyObject).description)
        }
        
        components?.queryItems = queryItems
        self.url = components?.url
    }
    
    fileprivate mutating func applyBody(_ request: Request) throws {
        guard 
            request.method == .post,
            request.parameters.count > 0
        else { return }
        
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
