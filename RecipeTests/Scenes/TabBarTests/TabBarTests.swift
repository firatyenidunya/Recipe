//
//  TabBarTests.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import XCTest
@testable import Recipe

class TabBarTests: XCTestCase {

    func testIfCollectionsIsFirst() throws {
        let tabBarController = TabBarController()

        guard let index = tabBarController.viewControllers?.firstIndex(where: { (controller) -> Bool in
            return controller is CollectionsViewController
        }) else {
            XCTFail("CollectionsViewController does not exist in the tabBar")
            return
        }

        XCTAssertEqual(tabBarController.selectedIndex, index)
    }

    func testRecipesFocusedWhenSelected() throws {
        let tabBarController = TabBarController()

        let recipesController = tabBarController.viewControllers![1]

        tabBarController.selectedIndex = 1

        XCTAssertEqual(tabBarController.selectedIndex, 1)
        XCTAssert(recipesController is RecipesViewController)
    }

    func testFavoritesFocusedWhenSelected() throws {
        let tabBarController = TabBarController()

        let favoritesController = tabBarController.viewControllers![2]

        tabBarController.selectedIndex = 2

        XCTAssertEqual(tabBarController.selectedIndex, 2)
        XCTAssert(favoritesController is FavoritesViewController)
    }

    func testTabBarItemsOrder() throws {
        let tabBarController = TabBarController()

        let viewControllers = tabBarController.viewControllers!

        XCTAssert(viewControllers[0] is CollectionsViewController)
        XCTAssert(viewControllers[1] is RecipesViewController)
        XCTAssert(viewControllers[2] is FavoritesViewController)
    }

}
