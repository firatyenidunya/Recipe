//
//  AppearanceInitializationService.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import UIKit

class AppearanceInitializationService: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializeTabBarAppearance()

        return true
    }

    func initializeTabBarAppearance() {

        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.isTranslucent = false

        let tabBarItemAppearance = UITabBarItem.appearance()
        tabBarItemAppearance.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 14)], for: [.normal])
    }
}
