//
//  SwitchScreen.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/3/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation
import UIKit

class SwitchScreen{
    //
    class func pushViewControllerWithObject(controllerName:screenOption,object:NSDictionary?,navigationControllerObject:UINavigationController){
        
        if let opt = controllerName.value{
            if let viewController = opt.values.first{
                
                
                switch viewController {
                    
                case Constants.viewControllers.homeController:
                    
                    let homeStoryBoard : UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
                    let homeViewController : HomeController = homeStoryBoard.instantiateViewController(withIdentifier: "HomeUI") as! HomeController
                    
                    navigationControllerObject.pushViewController(homeViewController, animated: true)
                    break
                default :
                    break
                }
            }
        }
    }
    
  
}
