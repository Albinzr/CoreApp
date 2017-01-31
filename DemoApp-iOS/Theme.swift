
//
//  Theme.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/4/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//


import Foundation
import UIKit
import Quintype
public struct Themes{
    
    public struct DefaultThemes{
        
        public struct navigation{
            static let navigationBarColor = UIColor(red: 46.0/255.0, green: 14.0/255.0, blue: 74.0/255.0, alpha: 1.0)
            static let navigationBarIconColor = UIColor.white
            static let navigationBarTitleColor = UIColor.white
            static let navigationBarTranslucent = false
            static let navigationHideOnScroll = true
        }
        
        public struct tabBar{
            static let tabBarColor = UIColor(red: 46.0/255.0, green: 14.0/255.0, blue: 74.0/255.0, alpha: 1.0)
            static let tabBarIconColor = UIColor.white
            static let tabBarShadowColor = UIColor.lightGray.cgColor
            static let tabBarTranslucent = false
            static let showTabarEditButton = false
            
        }
        
        public struct menu{
            static let tabarBackgroundColor = UIColor(red: 46.0/255.0, green: 14.0/255.0, blue: 74.0/255.0, alpha: 1.0)
            static let tabTextColor = UIColor.white
            static let tabTextAnimation = true
            static let selectionBarBackground = UIColor.red
            static let tabarheight = CGFloat(20)
            
        }
        
        static let homePageCells = HomePageCells.self
        static let storyDetailCells = StoryDetailCells.self
        
        
        
        
//        classic red UIColor(red: 255/255.0, green: 115/255.0, blue: 115/255.0, alpha: 1).cgColor
//        mega gray UIColor(red: 246/255.0, green: 246/255.0, blue: 246/255.0, alpha: 1).cgColor
    }
    
    
}
