//
//  NavigatonBarConfigurable.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import UIKit

protocol NavigatonBarConfigurable {
    func setNavigationBar()
    func setRightBarButton(title: String,
                           image: UIImage,
                           customButton: UIButton)
}

extension NavigatonBarConfigurable where Self: BaseViewController {

    func setNavigationBar() {
        navigationBar?.barTintColor = .primary
    }

    func setRightBarButton(title: String = "",
                           image: UIImage = UIImage(),
                           customButton: UIButton = UIButton(type: UIButton.ButtonType.custom)) {
        customButton.setTitle(title, for: .normal)
        customButton.setImage(image, for: .normal)
        customButton.addTarget(self, action: #selector(navigationBarRightButtonOnClick), for: .touchUpInside)

        let menuItem = UIBarButtonItem(customView: customButton)
        navigationBar?.topItem?.rightBarButtonItem = menuItem
    }
}
