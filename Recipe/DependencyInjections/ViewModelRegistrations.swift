//
//  ViewModelRegistrations.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Resolver

class ViewModelRegistrations: Registrationable {
    static func register() {
        Resolver.register { CollectionsViewModel() as CollectionsViewModelProtocol }
        Resolver.register { RecipesViewModel() as RecipesViewModelProtocol }
    }
}
