//
//  ServiceRegistrations.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Resolver

class ServiceRegistrations: Registrationable {
    static func register() {
        Resolver.register { BaseService() as BaseServiceProtocol }.scope(.application)
        Resolver.register { LocalService() as LocalServiceProtocol }.scope(.application)
        Resolver.register { CollectionsRemoteService() as CollectionsRemoteServiceProtocol }
        Resolver.register { RecipeRemoteService() as RecipeRemoteServiceProtocol }
    }
}
