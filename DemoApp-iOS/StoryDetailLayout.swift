//
//  StoryDetailLayout.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/30/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation
import Quintype

struct StoryDetailLayout{
    
    public enum storyDetailLayoutType : String{
        case headerCollection =  "headerCollectionCell"
        case defaultCollection =  "defaultStoryCell"
        
    }
    
    var layoutType:storyDetailLayoutType
    
    public init(layoutType:storyDetailLayoutType){
        
        self.layoutType = layoutType
    }
}
