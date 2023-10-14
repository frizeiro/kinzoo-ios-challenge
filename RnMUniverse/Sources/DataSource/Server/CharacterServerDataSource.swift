//
//  CharacterServerDataSource.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation
import PromiseKit

final class CharacterServerDataSource: CharacterDataSource {
    
    // MARK: - Public Variables
    
    private var client: Client
    
    // MARK: - Life Cycle
    
    init(_ client: Client) {
        self.client = client
    }
    
    // MARK: - Public Methods
    
    func fetch(page: Int, name: String?) -> Promise<CharactersResponse> {
        return execute(.fetch(page: page, name: name))
    }
    
    func detail(id: Int) -> Promise<Character> {
        return execute(.detail(id: id))
    }
    
    // MARK: - Private Methods
    
    private func execute<T: Decodable>(_ request: CharacterRequest) -> Promise<T> {
        return client.execute(request)
    }
    
}
