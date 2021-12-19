//
//  ViewControllerRegistrations.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Resolver

class ViewControllerRegistrations: Registrationable {
    static func register() {
        Resolver.register { CollectionsViewController() }
        Resolver.register { RecipesViewController() }
        Resolver.register { FavoritesViewController() }
    }
}
