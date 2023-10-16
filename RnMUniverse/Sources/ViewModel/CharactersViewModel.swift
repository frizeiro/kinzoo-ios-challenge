//
//  CharactersViewModel.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 15/10/23.
//

import Foundation
import NiceTable

class CharactersViewModel: BaseViewModel<Character, NiceCollectionSection, NiceCollectionItem> {
        
    // MARK: - Private Variables
    
    private var characters = [Character]()
    private var items = [CharacterCollectionItem]()
    
    // MARK: - Public Methods
        
    func fetch() {
        loaderHandler?(true)
        
        DataSource.shared.character.fetch(page: 1, name: nil).done { response in
            self.handle(response)
            self.bindHandler?(self.sections(self.items))
        }.catch { error in
            self.errorHandler?(1, error)
        }.finally {
            self.loaderHandler?(false)
        }
    }
    
    // MARK: - Private Methods
    
    private func handle(_ response: CharactersResponse) {
        if let results = response.results {
            characters.append(contentsOf: results)
            
            let resultsItems = results.compactMap { item($0) }
            items.append(contentsOf: resultsItems)
        }
    }
    
    private func item(
        _ character: Character
    ) -> CharacterCollectionItem {
        let item = CharacterCollectionItem(character)
        
        item.tappedHandler = { [weak self] in
            self?.tappedHandler?(character)
        }
        
        return item
    }
    
    private func sections(
        _ items: [CharacterCollectionItem]
    ) -> [NiceCollectionSection] {
        return [NiceCollectionSection(items, style: .noHeader)]
    }
    
}
