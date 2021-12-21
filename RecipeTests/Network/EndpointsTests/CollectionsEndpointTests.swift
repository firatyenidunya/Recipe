//
//  CollectionsEndpointsTests.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import XCTest
@testable import Recipe

class CollectionsEndpointTests: XCTestCase {

    func testIsAllCollectionsPathCorrect() {
        let given = CollectionsEndpoint.allCollections
        let expectedPath = "/global-mobile-hiring/api/collections"

        XCTAssertEqual(given.path, expectedPath)
    }

    func testIsAllCollectionsURLRequestValid() {
        let given = CollectionsEndpoint.allCollections
        let requestObject = RequestObject(path: given.path)

        XCTAssertNotNil(requestObject.urlRequest)
    }

    func testIsAllCollectionsHTTPMethodCorrect() {
        let given = CollectionsEndpoint.allCollections
        let requestObject = RequestObject(path: given.path)

        let expectedMethod = HTTPMethod.get

        XCTAssertEqual(requestObject.urlRequest!.httpMethod, expectedMethod.description)
    }

    func testIsAllCollectionsHTTPHeadersCorrect() {
        let given = CollectionsEndpoint.allCollections
        let requestObject = RequestObject(path: given.path)

        XCTAssertEqual(requestObject.urlRequest!.allHTTPHeaderFields, [:])
    }
}
