//
//  StoryDetailsContainerController.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/19/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit

class StoryDetailContainerController:BaseController{
    
    
    
    var slugCollection:[String]?
    var currentPage:Int?
    
    convenience init(slugArray: [String], currentSlugPosition: Int) {
        self.init()
        self.slugCollection = slugArray
          self.currentPage = currentSlugPosition
    }
    
    var pageViewController:UIPageViewController = {
        
        let pageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: nil)
        return pageViewController
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        let startingViewController = self.loadViewControllerAtIndex(index: currentPage!) as! StoryDetailPager
        let viewControllers = [startingViewController]
        
        pageViewController.setViewControllers(viewControllers, direction:UIPageViewControllerNavigationDirection.forward, animated:false, completion:nil)
        pageViewController.view.frame = self.view.frame
        
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        pageViewController.didMove(toParentViewController: self)
        self.edgesForExtendedLayout = []
        self.navigationController?.hidesBarsOnSwipe = false
        
        
    }
    
    
    
    
}


extension StoryDetailContainerController:UIPageViewControllerDataSource,UIPageViewControllerDelegate{
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as? StoryDetailPager
        var index = vc?.pageIndex
        
        if (index == NSNotFound ){
            
            return nil
        }
        
        index = index! + 1
        
        if (index == self.slugCollection?.count){
            
            return nil
        }
        
        return loadViewControllerAtIndex(index: index!)
        
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as? StoryDetailPager
        var index = vc?.pageIndex
        
        if (index == 0 || index == NSNotFound){
            
            return nil
        }
        
        index = index! - 1
        
        
        return loadViewControllerAtIndex(index: index!)
        
        
    }
    
    func loadViewControllerAtIndex(index: Int) -> UIViewController{
        
        
        
        let newController = StoryDetailPager(slug: (slugCollection?[index])!, Index: index)
        
        
        return newController
        
    }
    
    
    
    
}
