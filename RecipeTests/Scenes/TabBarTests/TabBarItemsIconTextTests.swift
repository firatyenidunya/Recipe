//
//  TabBarItemsIconTextTests.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import XCTest
@testable import Recipe

class TabBarItemsIconTextTests: XCTestCase {

    lazy var tabBarController: TabBarController = {
        let tabBarController = TabBarController()
        tabBarController.loadViewIfNeeded()

        return tabBarController
    }()

    func testCollectionsIconAndText() throws {
        let item = tabBarItem(at: 0)
        XCTAssertEqual(item.image, .iconsTabBarCollections)
        XCTAssertEqual(item.title, "Collections")
    }

    func testRecipesIconAndText() throws {
        let item = tabBarItem(at: 1)
        XCTAssertEqual(item.image, .iconsTabBarRecipes)
        XCTAssertEqual(item.title, "Recipes")
    }

    func testFavoritesIconAndText() throws {
        let item = tabBarItem(at: 2)
        XCTAssertEqual(item.image, .iconsTabBarFavorites)
        XCTAssertEqual(item.title, "Favorites")
    }

    // MARK: - Helpers

    func tabBarItem(at index: Int) -> UITabBarItem {
        return tabBarController.tabBar.items![index]
    }
}
