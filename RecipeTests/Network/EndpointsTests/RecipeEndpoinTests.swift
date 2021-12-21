//
//  RecipeEndpoinTests.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import XCTest
@testable import Recipe

class RecipeEndpointTests: XCTestCase {

    func testIsAllCollectionsPathCorrect() {
        let given = RecipeEndpoint.allRecipes
        let expectedPath = "/global-mobile-hiring/api/recipes"

        XCTAssertEqual(given.path, expectedPath)
    }

    func testIsAllCollectionsURLRequestValid() {
        let given = RecipeEndpoint.allRecipes
        let requestObject = RequestObject(path: given.path)

        XCTAssertNotNil(requestObject.urlRequest)
    }

    func testIsAllCollectionsHTTPMethodCorrect() {
        let given = RecipeEndpoint.allRecipes
        let requestObject = RequestObject(path: given.path)

        let expectedMethod = HTTPMethod.get

        XCTAssertEqual(requestObject.urlRequest!.httpMethod, expectedMethod.description)
    }

    func testIsAllCollectionsHTTPHeadersCorrect() {
        let given = RecipeEndpoint.allRecipes
        let requestObject = RequestObject(path: given.path)

        XCTAssertEqual(requestObject.urlRequest!.allHTTPHeaderFields, [:])
    }
}
