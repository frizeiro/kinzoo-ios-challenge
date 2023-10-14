//
//  NetworkManager.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation
import Network

class NetworkManager {
    
    // MARK: - Public Variables
    
    static let shared = NetworkManager()
    
    private(set) var isConnected = false
    
    // MARK: - Private Variables
    
    private let monitor = NWPathMonitor()
    
    private init() {}
    
    // MARK: - Public Methods
    
    func initialize() {
        monitor.pathUpdateHandler = { [weak self] in
            self?.isConnected = $0.status == .satisfied
        }
    }
    
}
