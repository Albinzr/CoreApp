//
//  StoryDetailsContainerController.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/19/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit
import XLPagerTabStrip



class StoryDetailContainerController:ButtonBarPagerTabStripViewController {
    
    var colorArray:[UIColor] = [.red,.yellow,.green,.gray,.lightGray]
    
    var currentStorySlugPosition:Int?
    var slugCollectionArray:[String] = []
    
    convenience init(slugArray:[String],currentSlugPosition:Int){
        self.init()
        currentStorySlugPosition = currentSlugPosition
        slugCollectionArray = slugArray
    }
    
    override func viewDidLoad() {
        
        // set up style before super view did load is executed
        settings.style.buttonBarHeight = 0
        settings.style.selectedBarHeight = 0
        //
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = ""
        self.automaticallyAdjustsScrollViewInsets = false
        
        buttonBarView.backgroundColor = Themes.DefaultThemes.menu.tabarBackgroundColor
        buttonBarView.selectedBar.backgroundColor = Themes.DefaultThemes.menu.selectionBarBackground
        NotificationCenter.default.addObserver(self, selector: #selector(StoryDetailContainerController.didEnterForeground(notification:)), name: Notification.Name.UIApplicationWillEnterForeground, object: nil)
        
    }
    
    func didEnterForeground(notification:Notification){
        
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        var viewControllerCollection:[UIViewController] = []
        
        for (index,value) in slugCollectionArray.enumerated(){
            let viewController = StoryDetailPager()
            viewController.view.backgroundColor = colorArray[Int(arc4random_uniform(UInt32(colorArray.count)))]
            viewControllerCollection.append(viewController)
            print(index)
        }
        
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
