//
//  PagerController.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/16/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit
import Quintype
import XLPagerTabStrip

class PagerController: BaseController,IndicatorInfoProvider {
    
    let reuseIdentifierHeaderCollectionCell = "headerCollectionCell"
    let reuseIdentifierDefaultStoryCollectionCell = "defaultStoryCell"
    
    let utility = QuintypeUtility.sharedInstance
    var menu:Menu?
    var offset:Int = 0
    var limit:Int = 0
    var sizingCells:[String:BaseCollectionCell] = [:]
    var lastContentOffset: CGFloat = 0
    
    let homeCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.collectionViewLayout = layout
        return collectionView
    }()
    
    var storyCollectionArray:[Story] = [] {
        
        didSet{
            self.homeCollectionView.reloadData()
            utility.hideActivityIndicatory(uiView: view)
            
        }
    }
    
    var tabName:String!
    
    init(singleMenu:Menu) {
        super.init()
        tabName = singleMenu.title
        menu = singleMenu
        
    }
    
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
        
        utility.showActivityIndicatory(uiView: view)
    
        if let slug =  menu?.section_slug{
            
            Quintype.api.getStories(options: storiesOption.section(sectionName: slug), fields: nil, offset: nil, limit: nil, storyGroup: nil, cache: cacheOption.cacheToMemoryAndDiskWithTime(min: 3), Success: { (storyCollection) in
                
                if let stories = storyCollection{
                    self.storyCollectionArray = stories
                    
                }
                
            }, Error: { (error) in
                
                print(error as Any)
                
            })
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        loadData()
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo.init(title: tabName)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

