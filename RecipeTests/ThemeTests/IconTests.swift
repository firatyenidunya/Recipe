//
//  IconTests.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 18.12.2021.
//

import XCTest
@testable import Recipe

class IconTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIconsTabBarRecipesIsNotNil() {
        let iconsTabBarRecipes: UIImage = .iconsTabBarRecipes
        XCTAssertNotEqual(iconsTabBarRecipes, UIImage())
    }

    func testIconsTabBarFavoritesIsNotNil() {
        let iconsTabBarFavorites: UIImage = .iconsTabBarFavorites
        XCTAssertNotEqual(iconsTabBarFavorites, UIImage())
    }
}
