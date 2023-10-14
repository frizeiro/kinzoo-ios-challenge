//
//  CharacterDataSource.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation
import PromiseKit

protocol CharacterDataSource {
    
    func fetch(page: Int, search: String?) -> Promise<CharactersResponse>
    func detail(id: Int) -> Promise<[Character]>
    
}
