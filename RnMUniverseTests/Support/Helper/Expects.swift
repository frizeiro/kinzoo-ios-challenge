//
//  Expects.swift
//  RnMUniverseTests
//
//  Created by Felipe Frizeiro on 17/10/23.
//

import Foundation
import Nimble
import NiceTable

@testable import RnMUniverse

func expectCodable<T>(
    _ type: T.Type,
    file: FileString = #file,
    line: UInt = #line
) where T : Codable & Equatable {
    let modelA = fromMock(type)
    
    let dataA = modelA.encoded()!
    let modelC = dataA.decoded(type)
        
    expect(file: file, line: line, modelA) == modelC
}

func expectNullable<T: Equatable>(
    file: FileString = #file,
    line: UInt = #line,
    _ expression: @autoclosure @escaping () throws -> T?,
    _ expected: T?
) {
    if let expected {
        expect(file: file, line: line, expression) == expected
    } else {
        expect(file: file, line: line, expression).to(beNil())
    }
}

func expectNiceTableSection(
    _ section: NiceTableSection?,
    itemsCount: Int = 0,
    title: String? = nil,
    footer: String? = nil,
    file: FileString = #file,
    line: UInt = #line
) {
    expect(file: file, line: line, section).toNot(beNil())
    
    expect(file: file, line: line, section?.items.count) == itemsCount
    expectNullable(file: file, line: line, section?.title, title)
    expectNullable(file: file, line: line, section?.footer, footer)
}

func expectNiceContentItem(
    _ niceContentItem: NiceTableItem?,
    title: String? = nil,
    label: String? = nil,
    subtitle: String? = nil,
    text: String? = nil,
    footer: String? = nil,
    image: UIImage? = nil,
    file: FileString = #file,
    line: UInt = #line
) {
    let item = niceContentItem as? NiceContentItem
    
    expect(file: file, line: line, item).toNot(beNil())
    expectNullable(file: file, line: line, item?.description.title, title)
    expectNullable(file: file, line: line, item?.description.label, label)
    expectNullable(file: file, line: line, item?.description.subtitle, subtitle)
    expectNullable(file: file, line: line, item?.description.text, text)
    expectNullable(file: file, line: line, item?.description.footer, footer)
    expectNullable(file: file, line: line, item?.description.image, image)
}

func expectCharacterHeaderItem(
    _ niceTableItem: NiceTableItem?,
    avatar: String? = nil,
    file: FileString = #file,
    line: UInt = #line
) {
    let item = niceTableItem as? CharacterHeaderItem
    
    expect(file: file, line: line, item).toNot(beNil())
    expectNullable(file: file, line: line, item?.avatar, avatar)
}
