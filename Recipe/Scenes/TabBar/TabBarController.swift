//
//  TabBarController.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: - Inhected Properties

    @Autowired var collectionsViewController: CollectionsViewController
    @Autowired var recipesViewController: RecipesViewController
    @Autowired var favoritesViewController: FavoritesViewController

    // MARK: - LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTabs()
    }

    func initializeTabs() {
        collectionsViewController.configure(title: "Collections", icon: .iconsTabBarCollections)
        recipesViewController.configure(title: "Recipes", icon: .iconsTabBarRecipes)
        favoritesViewController.configure(title: "Favorites", icon: .iconsTabBarFavorites)

        viewControllers = [collectionsViewController,
                           recipesViewController,
                           favoritesViewController]
    }
}

fileprivate extension UIViewController {
    func configure(title: String = "",
                   icon: UIImage) {
        tabBarItem.title = title
        tabBarItem.image = icon
    }
}
