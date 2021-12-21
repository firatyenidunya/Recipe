//
//  CollectionsUIModelConverterTests.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import XCTest
@testable import Recipe

class CollectionsUIModelConverterTests: XCTestCase {

    func testWhenResponseIsNil() {
        let result = CollectionsUIModel.convert(from: nil)

        XCTAssertEqual(result, [])
    }

    func testWhenResponseIsNotNil() {
        let mock = CollectionsResponseModel.mock()
        let expectedResult = CollectionsUIModel(id: Identifier<CollectionIdentifier>(id: 1),
                                                title: "First - 5 Recipes",
                                                coverImageURL: URL(string: "cookpad.github.io")!)

        let result = CollectionsUIModel.convert(from: mock)
        
        XCTAssertEqual(result, [expectedResult])
    }
}

fileprivate extension CollectionsResponseModel {
    static func mock() -> [Self] {
        return [Self(id: Identifier<CollectionIdentifier>(id: 1),
                     title: "First",
                     recipeCount: 5,
                     imageUrls: ["cookpad.github.io"])]
    }
}
