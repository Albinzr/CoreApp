//
//  Layout.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/23/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation
import Quintype

struct HomeLayout{
    
    public enum LayoutType : String{
        case headerCollection =  "headerCollectionCell"
        case defaultCollection =  "defaultStoryCell"
        
    }
    
    var layoutType:LayoutType
    
    public init(layoutType:LayoutType){
        
        self.layoutType = layoutType
    }
}
