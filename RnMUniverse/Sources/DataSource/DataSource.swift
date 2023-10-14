//
//  DataSource.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation

final class DataSource {
    
    // MARK: - Public Variables
    
    static let shared = DataSource()
    
    // MARK: - Private Variables
    
    private var serverClient = ServerClient(baseUrl: "https://rickandmortyapi.com/api")
    
    // MARK: DataSources
    
    public let character: CharacterDataSource
    
    // MARK: - Life Cycle
    
    init() {
        character = CharacterServerDataSource(serverClient)
    }
    
}
