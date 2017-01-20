//
//  HomeController.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/3/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit
import Quintype
import XLPagerTabStrip


class HomeContainerController: ButtonBarPagerTabStripViewController{
    
    var menu:[Menu]?
    
    convenience init(singleMenu:[Menu]?){
        self.init()
        menu = singleMenu
        
    }
    
    override func viewDidLoad() {
        // set up style before super view did load is executed
        settings.style.buttonBarBackgroundColor = .clear
        settings.style.selectedBarBackgroundColor = .red
        settings.style.buttonBarItemBackgroundColor = Themes.DefaultThemes.menu.tabarBackgroundColor
    
        //
        super.viewDidLoad()
        
        setupNavgationbar()
        if Themes.DefaultThemes.menu.tabTextAnimation{ tabarAnimation() }
        self.navigationItem.title = ""
        self.automaticallyAdjustsScrollViewInsets = false
        
        buttonBarView.backgroundColor = Themes.DefaultThemes.menu.tabarBackgroundColor
        buttonBarView.selectedBar.backgroundColor = Themes.DefaultThemes.menu.selectionBarBackground
    }

    private func tabarAnimation(){
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = UIColor(white: 1, alpha: 0.6)
            newCell?.label.textColor = .white
            
            if animated {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                })
            }
            else {
                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
    }
    
    
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        var viewControllerCollection:[UIViewController] = []
        
        menu?.forEach({ (menu) in
            print(menu.title!)
            let child_1 = PagerController.init(singleMenu: menu)
            child_1.viewDidLoad()
            viewControllerCollection.append(child_1)
            return
        })
        
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





