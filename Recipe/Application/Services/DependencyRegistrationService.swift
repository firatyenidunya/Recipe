//
//  DependencyRegistrationService.swift
//  Recipe
//
//  Created by Firat Yenidunya on 18.12.2021.
//

import Foundation
import Resolver

protocol Registrationable {
    static func register()
}

class DependencyRegistrationService: NSObject, UIApplicationDelegate {
    lazy var registrationList: [Registrationable.Type] = [ServiceRegistrations.self]

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        register()
    }

    private func register() -> Bool {
        registrationList.forEach { $0.register() }
        return true
    }
}
