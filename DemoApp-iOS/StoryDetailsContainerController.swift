//
//  StoryDetailsContainerController.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/19/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class StoryDetailsContainerController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        // set up style before super view did load is executed
        settings.style.buttonBarHeight = 0
        settings.style.selectedBarHeight = 0
        //
        super.viewDidLoad()
        
        self.navigationItem.title = ""
        self.automaticallyAdjustsScrollViewInsets = false
        
        buttonBarView.backgroundColor = Themes.DefaultThemes.menu.tabarBackgroundColor
        buttonBarView.selectedBar.backgroundColor = Themes.DefaultThemes.menu.selectionBarBackground
    }
    
    
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        var viewControllerCollection:[UIViewController] = []
  
        return viewControllerCollection
    }
    
    
    override func reloadPagerTabStripView() {
        
        if arc4random() % 2 == 0 {
            pagerBehaviour = .progressive(skipIntermediateViewControllers: arc4random() % 2 == 0 , elasticIndicatorLimit: arc4random() % 2 == 0 )
        }
        else {
            pagerBehaviour = .common(skipIntermediateViewControllers: arc4random() % 2 == 0)
        }
        super.reloadPagerTabStripView()
    }
    
    
}
