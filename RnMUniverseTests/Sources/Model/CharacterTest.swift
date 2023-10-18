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
        
        expect(model.id) == 38
        expect(model.name) == "Beth Smith"
        expect(model.status) == .alive
        expect(model.species) == "Human"
        expect(model.type) == ""
        expect(model.gender) == .female
        
        expect(model.origin).toNot(beNil())
        expect(model.origin.name) == "Earth (C-137)"
        
        expect(model.location).toNot(beNil())
        expect(model.location.name) == "Citadel of Ricks"
        
        expect(model.image) == "https://rickandmortyapi.com/api/character/avatar/38.jpeg"
        
        let expected = [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2",
            "https://rickandmortyapi.com/api/episode/3",
            "https://rickandmortyapi.com/api/episode/4",
            "https://rickandmortyapi.com/api/episode/5",
            "https://rickandmortyapi.com/api/episode/6",
            "https://rickandmortyapi.com/api/episode/22",
            "https://rickandmortyapi.com/api/episode/51"
        ].map { URL(string: $0) }
        
        expect(model.episode) == expected
        expect(model.url) == URL(string: "https://rickandmortyapi.com/api/character/38")
        expect(model.created) == DateFormatter.standardZ.date(from: "2017-11-05T09:48:44.230Z")
    }
    
    func testEnsureCorrectCodableOfCharacter() {
        expectCodable(Character.self)
    }
    
    func testEnsureCorrectEpisodeNumbers() {
        let model: Character = .fromMock()
        
        let expected = [1, 2, 3, 4, 5, 6, 22, 51]
        expect(model.episodeNumbers) == expected
    }
    
}
