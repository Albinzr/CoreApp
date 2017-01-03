//
//  InitialController
//  DemoApp-iOS
//
//  Created by Albin CR on 12/29/16.
//  Copyright © 2016 Albin CR. All rights reserved.
//

import UIKit
import  Quintype
class InitialController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Quintype.analytics.trackPageViewHomeVisit()
        
        Quintype.api.getStories(options: storiesOption.topStories, fields: nil, offset: nil, limit: nil, storyGroup: nil, cache: cacheOption.none) { (err, data) in
            
            print(data)
        }
        
        
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

