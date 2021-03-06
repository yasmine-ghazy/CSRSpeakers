//
//  AppDelegate.swift
//  CSRSpeakers
//
//  Created by apple on 8/5/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarController = UITabBarController()
        
        let speakersVC = SpeakersVC()
        speakersVC.title = "Speakers"
        speakersVC.view.backgroundColor = UIColor.orange
        
        let chatVC = SpeakersVC()
        chatVC.title = "Chat"
        chatVC.view.backgroundColor = UIColor.blue
        
        let homeVC = SpeakersVC()
        homeVC.title = "Home"
        homeVC.view.backgroundColor = UIColor.cyan
        
        let scheduleVC = SpeakersVC()
        scheduleVC.title = "Schedule"
        scheduleVC.view.backgroundColor = UIColor.blue
        
        let sponsorsVC = SpeakersVC()
        sponsorsVC.title = "Sponsors"
        sponsorsVC.view.backgroundColor = UIColor.cyan
        
        
        
        speakersVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        chatVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        scheduleVC.tabBarItem = UITabBarItem(tabBarSystemItem: ., tag: 3)
        sponsorsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .sponsors, tag: 4)
        
        let controllers = [speakersVC, chatVC, homeVC, scheduleVC, sponsorsVC]
        
        tabBarController.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

