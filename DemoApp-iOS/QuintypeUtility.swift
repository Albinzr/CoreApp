//
//  QuintypeUtility.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/3/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation
import UIKit

class QuintypeUtility{
    
    static let sharedInstance = QuintypeUtility()
    let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func showActivityIndicatory(uiView: UIView) {
        actInd.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        actInd.center = uiView.center
        actInd.hidesWhenStopped = true
        actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        uiView.addSubview(actInd)
        actInd.startAnimating()
        
    }
    func hideActivityIndicatory(){
        actInd.stopAnimating()
    }
    
//    class func presentHomeController(selfView:AnyObject){
//        let viewController:HomeController = HomeController()
//        selfView.present(viewController, animated: true, completion: nil)
//    }
    
    class func initNavgationAndTabBar(){
        
        //Accesing window of the app
        let appDelegate  = UIApplication.shared.delegate as? AppDelegate
        let window = appDelegate?.window
        window?.rootViewController = CustomTabBarController()
    }
    
}
