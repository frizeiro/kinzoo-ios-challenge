//
//  EpisodeDataSource.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 18/10/23.
//

import Foundation
import PromiseKit

protocol EpisodeDataSource {
    
    func detail(id: Int) -> Promise<Episode>
    func detail(ids: [Int]) -> Promise<[Episode]>
    
}
