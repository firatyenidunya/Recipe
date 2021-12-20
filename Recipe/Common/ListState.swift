//
//  ListState.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import UIKit

enum ListState {
    case list
    case grid

    var image: UIImage {
        switch self {
            case .grid:
                return UIImage.iconsGrid
            case .list:
                return UIImage.iconsList
        }
    }

    mutating func toggle() {
        switch self {
            case .list:
                self = .grid
            case .grid:
                self = .list
        }
    }
}
