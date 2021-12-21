//
//  UIIMageViewExtensions.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(with url: URL) {
        sd_setImage(with: url)
    }
}
