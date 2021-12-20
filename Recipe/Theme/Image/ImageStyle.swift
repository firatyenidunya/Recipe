//
//  ImageStyle.swift
//  Recipe
//
//  Created by Firat Yenidunya on 18.12.2021.
//

import UIKit

enum ImageStyle: String {
    case iconsTabBarRecipes
    case iconsTabBarFavorites
    case iconsTabBarCollections
    case iconsGrid
    case iconsList

    var image: UIImage {
        UIImage(named: rawValue) ?? UIImage()
    }
}
