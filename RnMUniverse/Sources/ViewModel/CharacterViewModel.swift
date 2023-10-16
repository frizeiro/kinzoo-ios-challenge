//
//  CharacterViewModel.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 16/10/23.
//

import Foundation
import NiceTable

class CharacterViewModel: BaseViewModel<Void, NiceTableSection, NiceTableItem> {
    
    // MARK: - Private Variables
    
    private(set) var character: Character
    private var items = [CharacterCollectionItem]()
    
    // MARK: Sections
    
    private var sections: [NiceTableSection] {
        return [
            detailsSection
        ]
    }
    
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
    
    // MARK: Items
    
    private lazy var statusItem: NiceContentItem? = {
        return item(
            label: "Status",
            text: character.status.rawValue
        )
    }()
    
    private lazy var speciesItem: NiceContentItem? = {
        return item(
            label: "Species",
            text: character.species
        )
    }()
    
    private lazy var typeItem: NiceContentItem? = {
        return item(
            label: "Type",
            text: character.type
        )
    }()
    
    private lazy var genderItem: NiceContentItem? = {
        return item(
            label: "Gender",
            text: character.gender.rawValue
        )
    }()
    
    private lazy var originItem: NiceContentItem? = {
        return item(
            label: "Origin",
            text: character.origin.name
        )
    }()
    
    private lazy var locationItem: NiceContentItem? = {
        return item(
            label: "Location",
            text: character.location.name
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
    ) -> NiceContentItem? {
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
