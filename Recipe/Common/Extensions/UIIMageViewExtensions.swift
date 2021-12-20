//
//  UIIMageViewExtensions.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with url: URL) {
        kf.setImage(with: url)
    }
}
