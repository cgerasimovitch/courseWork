//
//  AppDelegate.swift
//  MyHabits
//
//  Created by Admin on 8/19/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var firstTabNavigationController : UINavigationController!
    var secondTabNavigationControoller : UINavigationController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let tabBarController = UITabBarController()
        
        
        firstTabNavigationController = UINavigationController.init(rootViewController: HabitsViewController())
        secondTabNavigationControoller = UINavigationController.init(rootViewController: InfoViewController())
        tabBarController.viewControllers = [firstTabNavigationController, secondTabNavigationControoller]
        
        let item1 = UITabBarItem(title: "Привычки", image: UIImage(named: "Habits_tab_icon"), tag: 0)
        let item2 = UITabBarItem(title: "Информация", image:  UIImage(named: "info_tab_icon"), tag: 1)
        
        firstTabNavigationController.tabBarItem = item1
        secondTabNavigationControoller.tabBarItem = item2
        UITabBar.appearance().tintColor = .systemGray2
                
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

