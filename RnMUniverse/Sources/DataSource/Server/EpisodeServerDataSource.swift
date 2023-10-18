//
//  EpisodeServerDataSource.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 18/10/23.
//

import Foundation
import PromiseKit

final class EpisodeServerDataSource: EpisodeDataSource {
    
    // MARK: - Public Variables
    
    private var client: Client
    
    // MARK: - Life Cycle
    
    init(_ client: Client) {
        self.client = client
    }
    
    // MARK: - Public Methods
    
    func detail(id: Int) -> Promise<Episode> {
        return execute(.detail(id: id))
    }
    
    func detail(ids: [Int]) -> Promise<[Episode]> {
        return execute(.detailMany(ids: ids))
    }
    
    // MARK: - Private Methods
    
    private func execute<T: Decodable>(_ request: EpisodeRequest) -> Promise<T> {
        return client.execute(request)
    }
    
}
