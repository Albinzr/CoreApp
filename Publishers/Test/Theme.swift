//
//  Theme.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/4/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation
import UIKit

public struct Themes{
    
    public struct DefaultThemes{
        
        public struct navigation{
            static let navigationBarColor = UIColor(red: 46.0/255.0, green: 14.0/255.0, blue: 74.0/255.0, alpha: 1.0)
            static let navigationBarIconColor = UIColor.white
            static let navigationBarTitleColor = UIColor.white
            static let navigationBarTranslucent = true
            static let navigationHideOnScroll = true
        }
        
        public struct tabBar{
            static let tabBarColor = UIColor(red: 46.0/255.0, green: 14.0/255.0, blue: 74.0/255.0, alpha: 1.0)
            static let tabBarIconColor = UIColor.white
            static let tabBarShadowColor = UIColor.lightGray.cgColor
            static let tabBarTranslucent = true
            
            
        }
        
        
        
    }
    
    
}
