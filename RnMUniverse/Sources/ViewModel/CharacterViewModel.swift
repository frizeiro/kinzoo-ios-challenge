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
    private(set) var episodes = [Episode]()
    
    // MARK: Sections
    
    private var sections: [NiceTableSection] {
        return [
            headerSection,
            detailsSection,
            episodesSection
        ].compactMap { $0 }
    }
    
    private lazy var headerSection: NiceTableSection = {
        let items = [
            headerItem
        ].compactMap { $0 }
        
        return NiceTableSection(items, style: .noHeader)
    }()
    
    private lazy var detailsSection: NiceTableSection = {
        let items = [
            nameItem,
            statusItem,
            speciesItem,
            typeItem,
            genderItem,
            originItem,
            locationItem
        ].compactMap { $0 }
        
        return NiceTableSection(items)
    }()
    
    private lazy var episodesSection: NiceTableSection? = {
        guard let episodesItems else { return nil }
        
        return NiceTableSection(
            episodesItems,
            title: .R.episodes,
            footer: .R.episodes_message,
            style: .withFooter
        )
    }()
    
    // MARK: Items
    
    private lazy var headerItem: NiceTableItem = {
        return CharacterHeaderItem(character)
    }()
    
    private lazy var nameItem: NiceTableItem? = {
        return item(
            label: .R.name,
            text: character.name
        )
    }()
    
    private lazy var statusItem: NiceTableItem? = {
        return item(
            label: .R.status,
            text: character.status?.name
        )
    }()
    
    private lazy var speciesItem: NiceTableItem? = {
        return item(
            label: .R.species,
            text: character.species
        )
    }()
    
    private lazy var typeItem: NiceTableItem? = {
        return item(
            label: .R.type,
            text: character.type
        )
    }()
    
    private lazy var genderItem: NiceTableItem? = {
        return item(
            label: .R.gender,
            text: character.gender?.name
        )
    }()
    
    private lazy var originItem: NiceTableItem? = {
        return item(
            label: .R.origin,
            text: character.origin?.name
        )
    }()
    
    private lazy var locationItem: NiceTableItem? = {
        return item(
            label: .R.location,
            text: character.location?.name
        )
    }()
    
    private lazy var episodesItems: [NiceTableItem]? = {
        guard !episodes.isEmpty else { return nil }
        
        return episodes.map {
            return NiceContentItem(
                .description(
                    label: $0.episode?.description,
                    subtitle: $0.air_date,
                    text: $0.name,
                    style: .episodes
                )
            )
        }
    }()
    
    // MARK: - Life Cycle
    
    init(character: Character) {
        self.character = character
    }
    
    // MARK: - Public Methods
    
    override func fetch() {
        guard let id = character.id else { return }
        
        errorHandler?(nil)
        loaderHandler?(true)
        
        DataSource.shared.character.detail(id: id).then { response in
            self.character = response
            return DataSource.shared.episode.detail(ids: response.episodeNumbers)
        }.done { response in
            self.episodes = response
            self.bindHandler?(self.sections)
        }.catch { error in
            self.handle(error)
        }.finally {
            self.loaderHandler?(false)
        }
    }
    
    // MARK: - Private Methods
    
    private func item(
        label: String,
        text: String?
    ) -> NiceTableItem? {
        guard text?.isEmpty == false else { return nil }
        
        return NiceContentItem(
            .description(
                label: label,
                text: text,
                style: .inline
            )
        )
    }
    
}
