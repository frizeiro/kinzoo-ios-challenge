//
//  CharacterViewModelTest.swift
//  RnMUniverseTests
//
//  Created by Felipe Frizeiro on 18/10/23.
//

import Foundation
import XCTest
import Nimble
import NiceTable

@testable import RnMUniverse

class CharacterViewModelTest: StubbedTestCase {
    
    // MARK: - Private Variables
    
    private lazy var character: Character = {
        .fromMock()
    }()   
    
    private lazy var viewModel: CharacterViewModel = {
        let viewModel = CharacterViewModel(character: Character(id: 1))
        
        viewModel.errorHandler = { [weak self] error in
            self?.error = error
        }
        
        viewModel.loaderHandler = { [weak self] loader in
            self?.loader = loader
        }
        
        viewModel.bindHandler = { [weak self] sections in
            self?.sections = sections
        }
        
        return viewModel
    }()
    
    private var error: EmptyState?
    private var loader: Bool?
    private var sections: [NiceTableSection]?
    
    // MARK: - Life Cycle
    
    override func setUp() {
        super.setUp()
        
        error = nil
        loader = nil
        sections = nil
    }
    
    // MARK: - Public Methods
    
    func testEnsureViewModelStateForFetchSucceed() {
        stub(CharacterRequest.detail(id: 1))
        stub(EpisodeRequest.detailMany(ids: [1,2,3]))
        
        viewModel.fetch()
        
        expect(self.error).to(beNil())
        expect(self.loader) == true
        expect(self.loader).toEventually(beFalse())
        expect(self.sections).toNot(beNil())
        expect(self.error).to(beNil())
        
        expect(self.sections?.count) == 3
        
        expectNiceTableSection(sections?[0], itemsCount: 1)
        
        expectCharacterHeaderItem(sections?[0].items[0], avatar: character.image)
        
        expectNiceTableSection(sections?[1], itemsCount: 6)
        
        expectNiceContentItem(sections?[1].items[0], label: .R.name, text: character.name)
        expectNiceContentItem(sections?[1].items[1], label: .R.status, text: character.status?.name)
        expectNiceContentItem(sections?[1].items[2], label: .R.species, text: character.species)
        // Type is not shown
        expectNiceContentItem(sections?[1].items[3], label: .R.gender, text: character.gender?.name)
        expectNiceContentItem(sections?[1].items[4], label: .R.origin, text: character.origin?.name)
        expectNiceContentItem(sections?[1].items[5], label: .R.location, text: character.location?.name)
        
        expectNiceTableSection(
            sections?[2],
            itemsCount: 3,
            title: "Episodes",
            footer: "List of each episode which the character appears."
        )
        
        expectNiceContentItem(
            sections?[2].items[0],
            label: "S01E01",
            subtitle: "December 2, 2013",
            text: "Pilot"
        )
        
        expectNiceContentItem(
            sections?[2].items[1],
            label: "S01E02",
            subtitle: "December 9, 2013",
            text: "Lawnmower Dog"
        )
        
        expectNiceContentItem(
            sections?[2].items[2],
            label: "S01E03",
            subtitle: "December 16, 2013",
            text: "Anatomy Park"
        )
    }
    
    func testEnsureViewModelStateForFetchFailed() {
        stubEmpty(CharacterRequest.detail(id: 1))
        // when a request was failed
        
        viewModel.fetch()
        
        expect(self.error).to(beNil())
        expect(self.loader) == true
        expect(self.loader).toEventually(beFalse())
        expect(self.sections).to(beNil())
        expect(self.error).toNot(beNil())
    }
    
}
