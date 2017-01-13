//
//  InitialController
//  DemoApp-iOS
//
//  Created by Albin CR on 12/29/16.
//  Copyright © 2016 Albin CR. All rights reserved.
//

//MARK: - Controller only for getting config

import UIKit
import Quintype

class InitialController: UIViewController {
    
    let utility = QuintypeUtility.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        initializer()
        
    }
    
    
    private func initializer(){
        
        utility.showActivityIndicatory(uiView: view)
        Quintype.api.getPublisherConfig(cache: cacheOption.loadOldCacheAndReplaceWithNew, Success: { (data) in

            self.utility.hideActivityIndicatory(uiView: self.view)
            QuintypeUtility.initNavgationAndTabBar()
            
        }) { (error) in
            
            //TODO: - Try again logic -
            
        }
        
        
    }
    
    
   
}
