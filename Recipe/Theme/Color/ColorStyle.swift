//
//  ColorStyle.swift
//  Recipe
//
//  Created by Firat Yenidunya on 18.12.2021.
//

import UIKit

enum ColorStyle: String, Codable, CaseIterable {
    case primary
    case secondary

    var color: UIColor {
        UIColor(named: rawValue) ?? .black
    }
}
