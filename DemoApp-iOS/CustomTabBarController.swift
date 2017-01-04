//
//  CustomTabBarController.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/4/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation
import UIKit


class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeController = HomeController()
        let homeNavigationController = UINavigationController(rootViewController: homeController)
        homeNavigationController.title = "Home"
        homeNavigationController.tabBarItem.image = UIImage(named: "")
        
        let videoController = VideoController()
        let secondNavigationController = UINavigationController(rootViewController: videoController)
        secondNavigationController.title = "Video"
        secondNavigationController.tabBarItem.image = UIImage(named: "")
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
        
        viewControllers = [homeNavigationController, secondNavigationController]
        let navigationController:[UINavigationController] = viewControllers as! [UINavigationController]
        
        //MARK: - tabar theming -
        tabBar.barTintColor = Themes.DefaultThemes.tabBar.tabBarColor
        tabBar.tintColor = Themes.DefaultThemes.tabBar.tabBarIconColor
        tabBar.isTranslucent = Themes.DefaultThemes.tabBar.tabBarTranslucent
        topBorder.backgroundColor = Themes.DefaultThemes.tabBar.tabBarShadowColor
        
        //MARK: - navigation theming -
        
        navigationController.forEach({ (controller) in
            
            let navigationBar = controller.navigationBar
            
            navigationBar.tintColor = Themes.DefaultThemes.navigation.navigationBarIconColor//icon color
            navigationBar.barTintColor = Themes.DefaultThemes.navigation.navigationBarColor//backgroung color
            navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : Themes.DefaultThemes.navigation.navigationBarTitleColor]
            navigationBar.isTranslucent = Themes.DefaultThemes.navigation.navigationBarTranslucent
            controller.hidesBarsOnSwipe = Themes.DefaultThemes.navigation.navigationHideOnScroll
            
        })
        
    }
    func actionRefresh(){
        
    }
}

