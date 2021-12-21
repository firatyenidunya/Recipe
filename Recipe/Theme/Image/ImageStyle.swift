//
//  ImageStyle.swift
//  Recipe
//
//  Created by Firat Yenidunya on 18.12.2021.
//

import UIKit

enum ImageStyle: String {

    // MARK: - TabBar

    case iconsTabBarRecipes
    case iconsTabBarFavorites
    case iconsTabBarCollections

    // MARK: - View
    
    case iconsGrid
    case iconsList
    case iconsStarFilled
    case iconsStarEmpty

    var image: UIImage {
        UIImage(named: rawValue) ?? UIImage()
    }
}
