//
//  ScreenOption.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/3/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation

public enum screenOption {
    
    case ViewControllerName(Name:String)
    
    
    var value: [String:String]? {
        
        switch self {
            
        case .ViewControllerName(let Name):
            return [Constants.ScreenConstants.viewController: Name]
        }
        
    }
}
