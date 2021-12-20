//
//  RepositoryRegistrations.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Resolver

class RepositoryRegistrations: Registrationable {
    static func register() {
        Resolver.register { CollectionsRepository() as CollectionsRepositoryProtocol }
    }
}
