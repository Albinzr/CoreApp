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
    
    let screen = UIScreen.main.bounds
    let itemSizeForPortraitMode = 100
    let itemSizeForLandscapeMode = 200
    var menu:[Menu]?
    var offset:Int = 0
    var limit:Int = 0
    var sizingCells:[String:BaseCollectionCell] = [:]
  
    
    var storyCollectionArray:[[Story]?] = []
        {
        
        didSet{
            
            if menu?.count == storyCollectionArray.count{
                self.homeCollectionView.reloadData()
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
        
        view.addSubview(homeCollectionView)
        homeCollectionView.fillSuperview()
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.backgroundColor = UIColor.white
        homeCollectionView.register(HeaderCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifierHeaderCollectionCell)
        homeCollectionView.register(DefaultStoryCell.self, forCellWithReuseIdentifier: reuseIdentifierDefaultStoryCollectionCell)
        
        let sizingHeaderCell = HeaderCollectionCell.init(frame: CGRect.zero)
        sizingCells[reuseIdentifierHeaderCollectionCell] = sizingHeaderCell
        
        let sizingDefaultStoryCell = DefaultStoryCell.init(frame: CGRect.zero)
        sizingCells[reuseIdentifierDefaultStoryCollectionCell] = sizingDefaultStoryCell
    }
    
    override func loadData() {
        super.loadData()
        
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
    
    
    private func initNavgationbarIcon(){
        //TODO: - Error in click on search
        let rightSearchBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action:  #selector(searchTapped(sender:)))
        self.navigationItem.setRightBarButtonItems([rightSearchBarButtonItem], animated: true)
        
    }
    
    func searchTapped(sender:AnyObject){
        
    }
    
}



