//
//  DataSourceRegistrations.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Resolver

class DataSourceRegistrations: Registrationable {
    static func register() {
        Resolver.register { CollectionsRemoteDataSource() as CollectionsRemoteDataSourceProtocol }
        Resolver.register { RecipeRemoteDataSource() as RecipeRemoteDataSourceProtocol }
    }
}
