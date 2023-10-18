//
//  CharactersViewModel.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 15/10/23.
//

import Foundation
import NiceTable

class CharactersViewModel: BaseViewModel<Character, NiceCollectionSection> {
        
    // MARK: - Private Variables
    
    private var currentPage: Int?
    private var nextPage: Int? = 1
    private var isLoadingMore = false
    
    private var hasMorePages: Bool {
        return nextPage != nil
    }
    
    private var characters = [Character]()
    private var items = [CharacterCollectionItem]()
    
    private var sections: [NiceCollectionSection] {
        return sections(items)
    }
    
    // MARK: - Public Methods
        
    override func fetch() {
        guard let nextPage else { return }
        
        errorHandler?(nil)
        loaderHandler?(true)
        
        DataSource.shared.character.fetch(page: nextPage, name: nil).done { response in
            self.handle(response)
            self.bindHandler?(self.sections)
        }.catch { error in
            self.handle(error)
        }.finally {
            self.loaderHandler?(false)
        }
    }
    
    func fetchNextPage() {
        guard !isLoadingMore, let nextPage else { return }
        
        isLoadingMore = true
        errorHandler?(nil)
        
        DataSource.shared.character.fetch(page: nextPage, name: nil).done { response in
            self.handle(response)
            self.paginationHandler?(self.sections, self.hasMorePages)
        }.catch { error in
            // TODO: Handle error on load more
        }.finally {
            self.isLoadingMore = false
        }
    }
    
    // MARK: - Private Methods
    
    private func handle(_ response: CharactersResponse) {
        currentPage = nextPage
        nextPage = currentPage! + 1
        
        if let pages = response.info?.pages, let nextPage, pages < nextPage {
            self.nextPage = nil
        }
        
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
