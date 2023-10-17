//
//  CharacterViewModel.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 16/10/23.
//

import Foundation
import NiceTable

class CharacterViewModel: BaseViewModel<Void, NiceTableSection> {
    
    // MARK: - Private Variables
    
    private(set) var character: Character
    
    // MARK: Sections
    
    private var sections: [NiceTableSection] {
        return [
            headerSection,
            detailsSection,
            episodesSection
        ]
    }
    
    private lazy var headerSection: NiceTableSection = {
        let items = [
            headerItem
        ].compactMap { $0 }
        
        return NiceTableSection(items, style: .noHeader)
    }()
    
    private lazy var detailsSection: NiceTableSection = {
        let items = [
            statusItem,
            speciesItem,
            typeItem,
            genderItem,
            originItem,
            locationItem
        ].compactMap { $0 }
        
        return NiceTableSection(items)
    }()
    
    private lazy var episodesSection: NiceTableSection = {
        let items = [
            episodesItem
        ].compactMap { $0 }
        
        return NiceTableSection(items, title: "Episodes")
    }()
    
    // MARK: Items
    
    private lazy var headerItem: NiceTableItem = {
        return CharacterHeaderItem(character)
    }()
    
    private lazy var statusItem: NiceTableItem? = {
        return item(
            label: "Status",
            text: character.status.rawValue
        )
    }()
    
    private lazy var speciesItem: NiceTableItem? = {
        return item(
            label: "Species",
            text: character.species
        )
    }()
    
    private lazy var typeItem: NiceTableItem? = {
        return item(
            label: "Type",
            text: character.type
        )
    }()
    
    private lazy var genderItem: NiceTableItem? = {
        return item(
            label: "Gender",
            text: character.gender.rawValue
        )
    }()
    
    private lazy var originItem: NiceTableItem? = {
        return item(
            label: "Origin",
            text: character.origin.name
        )
    }()
    
    private lazy var locationItem: NiceTableItem? = {
        return item(
            label: "Location",
            text: character.location.name
        )
    }()
    
    private lazy var episodesItem: NiceTableItem? = {
        return NiceContentItem(
            .description(
                text: character.episodeNumbers.map { $0.description }.joined(separator: ", ")
            )
        )
    }()
    
    // MARK: - Life Cycle
    
    init(character: Character) {
        self.character = character
    }
    
    // MARK: - Public Methods
    
    func fetch() {
        loaderHandler?(true)
        
        DataSource.shared.character.detail(id: character.id).done { response in
            self.character = response
            self.bindHandler?(self.sections)
        }.catch { error in
            self.errorHandler?(0, error)
        }.finally {
            self.loaderHandler?(false)
        }
    }
    
    // MARK: - Private Methods
    
    private func item(
        label: String,
        text: String
    ) -> NiceTableItem? {
        guard !text.isEmpty else { return nil }
        
        return NiceContentItem(
            .description(
                label: label,
                text: text,
                style: .inline
            )
        )
    }
    
}
