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
    
    private var serverClient = ServerClient(
        baseUrl: "https://rickandmortyapi.com/api",
        serializer: DataSourceCoder.shared
    )
    
    // MARK: DataSources
    
    public let character: CharacterDataSource
    public let episode: EpisodeDataSource
    
    // MARK: - Life Cycle
    
    init() {
        character = CharacterServerDataSource(serverClient)
        episode = EpisodeServerDataSource(serverClient)
    }
    
}
