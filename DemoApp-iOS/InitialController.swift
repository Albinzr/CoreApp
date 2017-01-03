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
        view.backgroundColor = .black
        
        utility.showActivityIndicatory(uiView: view)
        Quintype.api.getPublisherConfig(cache: cacheOption.loadOldCacheAndReplaceWithNew, Success: { (data) in
            
            print(data!)
            self.view.backgroundColor = .red
            self.utility.hideActivityIndicatory()
        }) { (error) in
            
        }
        
    }
}

