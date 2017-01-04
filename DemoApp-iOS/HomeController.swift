//
//  HomeController.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/3/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavgationbarIcon()
        self.navigationItem.title = "..Home.."
    }
    
    
    private func initNavgationbarIcon(){
        //TODO: - Error in click on search
        let rightSearchBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action:  #selector(searchTapped(sender:)))
        self.navigationItem.setRightBarButtonItems([rightSearchBarButtonItem], animated: true)
        
    }
    
    func searchTapped(sender:AnyObject){
        
    }
    
}
