//
//  RecipeUIModelConverter.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import XCTest
@testable import Recipe

class RecipeUIModelConverter: XCTestCase {

    func testWhenResponseIsNil() {
        let result = RecipeUIModel.convert(from: nil, from: [])
        XCTAssertEqual(result, [])
    }

    func testWithData() {
        let result = RecipeUIModel.convert(from: RecipeResponseModel.mock(),
                                           from: [])
        let expected = RecipeUIModel(id: Identifier<RecipeIdentifier>(id: 1),
                                     title: "First",
                                     coverImageURL: URL(string: "www.google.com")!,
                                     isFavorited: false)

        XCTAssertEqual(result, [expected])
    }
}

fileprivate extension RecipeResponseModel {
    static func mock() -> [Self] {
        return [RecipeResponseModel(id: Identifier<RecipeIdentifier>(id: 1),
                                    title: "First",
                                    coverImageURLString: "www.google.com")]
    }
}
