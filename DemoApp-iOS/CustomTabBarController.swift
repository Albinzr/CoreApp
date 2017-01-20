//
//  CustomTabBarController.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/4/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation
import UIKit
import Quintype

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuArray = Quintype.publisherConfig?.layout?.menu
        var navigationController:[UINavigationController] = []
        
        for i in 0...menuArray!.count - 1{
            
            var currentMenuCollection =  menuArray?.filter({ (menu:Menu) -> Bool in return  menuArray?[i].id == menu.parent_id })
            
            currentMenuCollection?.append(menuArray![i])
            let homeController = HomeContainerController(singleMenu:currentMenuCollection)
            let homeNavigationController = UINavigationController(rootViewController: homeController)
            homeNavigationController.title = menuArray?[i].title
            homeNavigationController.tabBarItem.image = UIImage(named: "")
            navigationController.append(homeNavigationController)
            
        }
        
        // passing all the navigation controller to view controller
        viewControllers = navigationController
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
        
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
            //removerd shadow line bellow navigation bar
            navigationBar.shadowImage = UIImage()
            navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        })
        
        let moreNavigationBar = self.moreNavigationController.navigationBar
        let moreNavigationController = self.moreNavigationController
        
        
        moreNavigationBar.barTintColor = Themes.DefaultThemes.navigation.navigationBarColor//backgroung color
        moreNavigationBar.tintColor = Themes.DefaultThemes.navigation.navigationBarIconColor
        moreNavigationBar.isTranslucent = Themes.DefaultThemes.navigation.navigationBarTranslucent
        moreNavigationBar.titleTextAttributes = [NSForegroundColorAttributeName : Themes.DefaultThemes.navigation.navigationBarTitleColor]
        moreNavigationController.hidesBarsOnSwipe = Themes.DefaultThemes.navigation.navigationHideOnScroll
        
        if let moreTableView = moreNavigationController.topViewController?.view as? UITableView {
            for cell in moreTableView.visibleCells{
                cell.textLabel?.textColor = UIColor.red
                cell.imageView?.image = cell.imageView?.image?.withRenderingMode(.alwaysTemplate)
            }
        }
    }
}
//    override open func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        
//        
//        ///  for controller in self.viewControllers!{
//        let controller = self.selectedViewController!
//        print(controller)
//        if controller.isMember(of: UINavigationController.self){
//            let navController = controller as! UINavigationController
//            //    controller.viewWillTransition(to: size, with: coordinator)
//            for controllerd in (navController.viewControllers){
//                print(controllerd)
//                controller.viewWillTransition(to: size, with: coordinator)
//            }
//        }
//        
//        
//        //  }
//        /*   coordinator.animate(alongsideTransition: { (context) in
//         
//         
//         }) { (context) in
//         
//         }
//         
//         super.viewWillTransition(to: size, with: coordinator)
//         */
//        // super.viewWillTransition(to: size, with: coordinator)
//    }
//
//    
//    
//    func actionRefresh(){
//        
//    }
//}

//extension moreNavigationController{
//
//
//
//}

