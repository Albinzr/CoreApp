//
//  AppDelegate.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 12/29/16.
//  Copyright © 2016 Albin CR. All rights reserved.
//

import UIKit

//MARK: - Internal lib -

import Quintype


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var navigationController: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Quintype.initWithBaseUrl(baseURL: "http://www.sakshipost.com")
        
        loadInitialViewController()
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.makeKeyAndVisible()
//        window?.rootViewController = CustomTabBarController()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}
    
    func applicationDidEnterBackground(_ application: UIApplication) {}
    
    func applicationWillEnterForeground(_ application: UIApplication) {}
    
    func applicationDidBecomeActive(_ application: UIApplication) {}
    
    func applicationWillTerminate(_ application: UIApplication) {}
    
    
    func loadInitialViewController(){
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        // Set Background Color of window
        window?.backgroundColor = UIColor.white
        // Allocate memory for an instance of the 'MainViewController' class
        let mainViewController = InitialController()
        // Set the root view controller of the app's window
        window!.rootViewController = mainViewController
        // Make the window visible
        window!.makeKeyAndVisible()
        
    }
    
}

