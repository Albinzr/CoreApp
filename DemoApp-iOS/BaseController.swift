//
//  BaseController.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/6/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    
    override func viewDidLoad() {
       self.automaticallyAdjustsScrollViewInsets = false
          
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupViews(){
        
    }
    
    public func loadData(){
        
        
    }
    
    
    
}


