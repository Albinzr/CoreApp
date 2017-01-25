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
        setupViews()
        NotificationCenter.default.addObserver(self, selector: #selector(BaseController.didEnterForeground(notification:)), name: Notification.Name.UIApplicationWillEnterForeground, object: nil)
        loadData()
        
    }
    
    func didEnterForeground(notification:Notification){
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        self.automaticallyAdjustsScrollViewInsets = false
        
    }
    
    
    public func setupViews(){
        
    }
    
    public func loadData(){
        clearUnusedImagesfromCache()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


