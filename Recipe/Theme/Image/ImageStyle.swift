//
//  ImageStyle.swift
//  Recipe
//
//  Created by Firat Yenidunya on 18.12.2021.
//

import UIKit

enum ImageStyle: String, Codable, CaseIterable {
    case iconsTabBarRecipes
    case iconsTabBarFavorites

    var image: UIImage {
        UIImage(named: rawValue) ?? UIImage()
    }
}
