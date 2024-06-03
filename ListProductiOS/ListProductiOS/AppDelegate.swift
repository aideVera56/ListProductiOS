//
//  AppDelegate.swift
//  ListProductiOS
//
//  Created by Jessica Vera Perez on 30/05/24.
//

import UIKit
import ProductList

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = OpenClassProductList.openModule()
        let navController = UINavigationController(rootViewController: vc)
        window = UIWindow()
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        return true
    }
    
}
