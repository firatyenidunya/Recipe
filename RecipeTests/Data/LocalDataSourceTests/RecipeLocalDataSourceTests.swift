//
//  RecipeLocalDataSourceTests.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import XCTest
import Resolver
@testable import Recipe

class RecipeLocalDataSourceTests: XCTestCase {
    var sut: RecipeLocalDataSourceProtocol!

    override func setUpWithError() throws {
        Resolver.setUp()
        Resolver.test.register { MockLocalService() as LocalServiceProtocol }
        sut = RecipeLocalDataSource()
    }

    override func tearDownWithError() throws {
        Resolver.tearDown()
        sut = nil
    }

    func testAddRecipeToFavorites() {
        // Given
        let recipe = RecipeUIModel.mock()

        // When
        sut.addRecipeToFavorites(with: recipe)
        let result = sut.getFavoritedRecipes().first

        // Then
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.id, 1)
        XCTAssertEqual(result?.title, "First")
        XCTAssertEqual(result?.coverImageURL, URL(string: "www.google.com"))
    }

    func testRemoveFromFavorites() {
        // Given
        let recipe = RecipeUIModel.mock()

        // When
        sut.addRecipeToFavorites(with: recipe)
        let result = sut.getFavoritedRecipes().first

        XCTAssertNotNil(result)

        sut.removeRecipeFromFavorites(with: recipe)

        // Then
        let deletedResult = sut.getFavoritedRecipes().first

        XCTAssertNil(deletedResult)
    }

    func testWhenUserInitiatedFirst() {
        let result = sut.getFavoritedRecipes().first
        XCTAssertNil(result)
    }
}

fileprivate extension RecipeUIModel {
    static func mock() -> RecipeUIModel {
        return RecipeUIModel(id: Identifier<RecipeIdentifier>(id: 1),
                             title: "First",
                             coverImageURL: URL(string: "www.google.com")!,
                             isFavorited: true)
    }
}
