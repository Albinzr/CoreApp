//
//  HomeController.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/3/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit
import Quintype


class HomeController: BaseController{
    let reuseIdentifierHeaderCollectionCell = "headerCollectionCell"
    let reuseIdentifierDefaultStoryCollectionCell = "defaultStoryCell"
    
    let utility = QuintypeUtility.sharedInstance
    
    let screen = UIScreen.main.bounds
    let itemSizeForPortraitMode = 100
    let itemSizeForLandscapeMode = 200
    var menu:[Menu]?
    var offset:Int = 0
    var limit:Int = 0
    var sizingCells:[String:BaseCollectionCell] = [:]
    
    var pageMenu : CAPSPageMenu?
  
    
    var storyCollectionArray:[[Story]?] = []
        {
        
        didSet{
            
            if menu?.count == storyCollectionArray.count{
//                self.homeCollectionView.reloadData()
                utility.hideActivityIndicatory(uiView: view)
            }
        }
        
    }
    
    
    convenience init(singleMenu:[Menu]?){
        self.init()
        menu = singleMenu
    }
    
    let homeCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.collectionViewLayout = layout
        return collectionView
    }()
    
    override func setupViews() {
        super.setupViews()
        
//        view.addSubview(homeCollectionView)
//        homeCollectionView.fillSuperview()
//        homeCollectionView.delegate = self
//        homeCollectionView.dataSource = self
//        homeCollectionView.backgroundColor = UIColor.white
//        homeCollectionView.register(HeaderCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifierHeaderCollectionCell)
//        homeCollectionView.register(DefaultStoryCell.self, forCellWithReuseIdentifier: reuseIdentifierDefaultStoryCollectionCell)
//
//        let sizingHeaderCell = HeaderCollectionCell.init(frame: CGRect.zero)
//        sizingCells[reuseIdentifierHeaderCollectionCell] = sizingHeaderCell
//        
//        let sizingDefaultStoryCell = DefaultStoryCell.init(frame: CGRect.zero)
//        sizingCells[reuseIdentifierDefaultStoryCollectionCell] = sizingDefaultStoryCell
    }
    
    override func loadData() {
        super.loadData()
        utility.showActivityIndicatory(uiView: view)
        menu?.forEach({ (singleMenu) in
            
            if let slug =  singleMenu.section_slug{
                
                Quintype.api.getStories(options: storiesOption.section(sectionName: slug), fields: nil, offset: nil, limit: nil, storyGroup: nil, cache: cacheOption.cacheToMemoryAndDiskWithTime(min: 3), Success: { (storyCollection) in
                    
                    if let stories = storyCollection{
                        
                        self.storyCollectionArray.append(stories)
                    }
                    
                }, Error: { (error) in
                    
                    print(error as Any)
                    
                })
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        loadData()
        initNavgationbarIcon()
        self.navigationItem.title = "..Home.."
        
        
       
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ///
        
        var controllerArray : [UIViewController] = []
        for i in 0...10{
            
            let controller1  = UIViewController()
            controller1.view.backgroundColor = .red
            controllerArray.append(controller1)
            controller1.title = "FRIENDS \(i)"
        }
        
        
        
        
        // Customize menu (Optional)
        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)),
            .viewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
            .selectionIndicatorColor(UIColor.orange),
            .bottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .menuItemFont(UIFont(name: "HelveticaNeue", size: 13.0)!),
            .menuHeight(40.0),
            .menuItemWidth(90.0),
            .centerMenuItems(true)
        ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x:self.view.frame.origin.x, y: 60, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: nil)
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
//        pageMenu?.
        
        pageMenu!.didMove(toParentViewController: self)
        
        
        ///
        
    }
    private func initNavgationbarIcon(){
        //TODO: - Error in click on search
        let rightSearchBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action:  #selector(searchTapped(sender:)))
        self.navigationItem.setRightBarButtonItems([rightSearchBarButtonItem], animated: true)
        
    }
    
    func searchTapped(sender:AnyObject){
        
    }
    func didTapGoToLeft() {
        let currentIndex = pageMenu!.currentPageIndex
        
        if currentIndex > 0 {
            pageMenu!.moveToPage(currentIndex - 1)
        }
    }
    
    func didTapGoToRight() {
        let currentIndex = pageMenu!.currentPageIndex
        
        if currentIndex < pageMenu!.controllerArray.count {
            pageMenu!.moveToPage(currentIndex + 1)
        }
    }
    
    // MARK: - Container View Controller
    override var shouldAutomaticallyForwardAppearanceMethods : Bool {
        return true
    }
    
    override func shouldAutomaticallyForwardRotationMethods() -> Bool {
        return true
    }
    

}



