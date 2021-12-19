//
//  ServiceInjections.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Resolver

class ServiceRegistrations: Registrationable {
    static func register() {
        Resolver.register { BaseService() as BaseServiceProtocol }.scope(.application)
    }
}
