//
//  AppDelegate.swift
//  Sample
//
//  Created by Dominic Valencia on 7/26/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let appCoordinator = AppCoordinator(window: window)
        appCoordinator.start()
        
        return true
    }

}

