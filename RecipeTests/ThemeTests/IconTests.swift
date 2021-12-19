//
//  IconTests.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 18.12.2021.
//

import XCTest
@testable import Recipe

class IconTests: XCTestCase {

    func testIconsTabBarRecipesIsNotNil() {
        let iconsTabBarRecipes: UIImage = .iconsTabBarRecipes
        XCTAssertNotEqual(iconsTabBarRecipes, UIImage())
    }

    func testIconsTabBarFavoritesIsNotNil() {
        let iconsTabBarFavorites: UIImage = .iconsTabBarFavorites
        XCTAssertNotEqual(iconsTabBarFavorites, UIImage())
    }
}
