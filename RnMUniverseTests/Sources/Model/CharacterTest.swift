//
//  CharacterTest.swift
//  RnMUniverseTests
//
//  Created by Felipe Frizeiro on 17/10/23.
//

import XCTest
import Nimble

@testable import RnMUniverse

class CharacterTest: XCTestCase {
    
    // MARK: - Public Methods
    
    func testEnsureCorrectDecodeOfCharacter() {
        let model: Character = .fromMock()
        
        expect(model.id) == 1
        expect(model.name) == "Rick Sanchez"
        expect(model.status) == .alive
        expect(model.species) == "Human"
        expect(model.type) == ""
        expect(model.gender) == .male
        
        expect(model.origin).toNot(beNil())
        expect(model.origin?.name) == "Earth (C-137)"
        
        expect(model.location).toNot(beNil())
        expect(model.location?.name) == "Citadel of Ricks"
        
        expect(model.image) == "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
        
        let expected = [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2",
            "https://rickandmortyapi.com/api/episode/3"
        ].map { URL(string: $0) }
        
        expect(model.episode) == expected
        expect(model.url) == URL(string: "https://rickandmortyapi.com/api/character/1")
        expect(model.created) == DateFormatter.standardZ.date(from: "2017-11-04T18:48:46.250Z")
    }
    
    func testEnsureCorrectCodableOfCharacter() {
        expectCodable(Character.self)
    }
    
    func testEnsureDecodeFromInvalidJson() {
        let model: Character = .fromEmptyMock()
        
        expect(model).toNot(beNil())
        expect(model) == Character()
    }
    
    func testEnsureCorrectEpisodeNumbers() {
        var model: Character = .fromMock()
        
        let expected = [1, 2, 3]
        expect(model.episodeNumbers) == expected
        
        model = Character()
        expect(model.episodeNumbers) == []
    }
    
}
