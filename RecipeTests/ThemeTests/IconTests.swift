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

    func testIconsListIsNotNil() {
        let iconsTabBarFavorites: UIImage = .iconsList
        XCTAssertNotEqual(iconsTabBarFavorites, UIImage())
    }

    func testIconsGridIsNotNil() {
        let iconsTabBarFavorites: UIImage = .iconsGrid
        XCTAssertNotEqual(iconsTabBarFavorites, UIImage())
    }

    func testIconsStarFilledIsNotNil() {
        let iconsStarFilled: UIImage = .iconsStarFilled
        XCTAssertNotEqual(iconsStarFilled, UIImage())
    }

    func testIconsStarEmptyIsNotNil() {
        let iconsStarEmpty: UIImage = .iconsStarEmpty
        XCTAssertNotEqual(iconsStarEmpty, UIImage())
    }
}
