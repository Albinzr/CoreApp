//
//  StoryDetailPager.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/23/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit
import Quintype

class StoryDetailPager: BaseController {
    
    let reuseIdentifierStoryHeaderImageCell = "storyHeaderImageCell"
    let reuseIdentifierStoryHeaderDetailCell = "storyHeaderDetailCell"
    let reuseIdentifierStoryDetailSocialShareCell = "storyDetailSocialShareCell"
    let reuseIdentifierStoryDetailTextElementCell = "storyDetailTextElementCell"
    let reuseIdentifierStoryDetailBackQuoteCell = "storyDetailBackQuoteCell"
    let reuseIdentifierStoryDetailQuoteElementCell = "storyDetailQuoteElementCell"
    let reuseIdentifierStoryDetailBlurbElementCell = "storyDetailBlurbElementCell"
    let reuseIdentifierStoryDetailQnACell = "storyDetailQnACell"
    let reuseIdentifierStoryDetailBigFactElementCell = "storyDetailBigFactElementCell"
    let reuseIdentifierStoryDetailAuthorElemenCell = "storyDetailAuthorElemenCell"
    let reuseIdentifierStoryDetailsTagElementCell = "storyDetailsTagElementCell"
    
    //StoryDetailstagElementCell
    
    
    
    let screenSize = UIScreen.main.bounds
    var pageIndex:Int?
    var currentSlug:String?
    let utility = QuintypeUtility.sharedInstance
    var sizingCells:[String:BaseCollectionCell] = [:]
    
    var storyDetail:Story = Story() {
        
        didSet{
            self.homeCollectionView.reloadData()
            utility.hideActivityIndicatory(uiView: view)
            
        }
        
    }
    
    convenience init(slug:String,Index:Int) {
        self.init()
        pageIndex = Index
        currentSlug = slug
    }
    
    let homeCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.collectionViewLayout = layout
        collectionView.scrollsToTop = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(homeCollectionView)
        homeCollectionView.fillSuperview()
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.backgroundColor = UIColor.white
        
        homeCollectionView.register(StoryDetailHeaderImageCell.self, forCellWithReuseIdentifier:    reuseIdentifierStoryHeaderImageCell)
        homeCollectionView.register(StoryDetailHeaderDetailCell.self, forCellWithReuseIdentifier:   reuseIdentifierStoryHeaderDetailCell)
        homeCollectionView.register(StoryDetailSocialShareCell.self, forCellWithReuseIdentifier:    reuseIdentifierStoryDetailSocialShareCell)
        homeCollectionView.register(StoryDetailTextElementCell.self, forCellWithReuseIdentifier:    reuseIdentifierStoryDetailTextElementCell)
        homeCollectionView.register(StoryDetailBackQuoteCell.self, forCellWithReuseIdentifier:      reuseIdentifierStoryDetailBackQuoteCell)
        homeCollectionView.register(StoryDetailQuoteElementCell.self, forCellWithReuseIdentifier:   reuseIdentifierStoryDetailQuoteElementCell)
        homeCollectionView.register(StoryDetailBlurbElementCell.self, forCellWithReuseIdentifier:   reuseIdentifierStoryDetailBlurbElementCell)
        homeCollectionView.register(StoryDetailQnAElementCell.self, forCellWithReuseIdentifier:     reuseIdentifierStoryDetailQnACell)
        homeCollectionView.register(StoryDetailBigFactElementCell.self, forCellWithReuseIdentifier: reuseIdentifierStoryDetailBigFactElementCell)
        homeCollectionView.register(StoryDetailAuthorElemenCell.self, forCellWithReuseIdentifier:   reuseIdentifierStoryDetailAuthorElemenCell)
        homeCollectionView.register(StoryDetailsTagElementCell.self, forCellWithReuseIdentifier:   reuseIdentifierStoryDetailsTagElementCell)
        
        
        //        StoryDetailsTagElementCell
        
        let storyDetailHeaderImageCell = StoryDetailHeaderImageCell.init(frame: CGRect.zero)
        sizingCells[reuseIdentifierStoryHeaderImageCell] = storyDetailHeaderImageCell
        
        let storyDetailHeaderDetailCell = StoryDetailHeaderDetailCell.init(frame: CGRect.zero)
        sizingCells[reuseIdentifierStoryHeaderDetailCell] = storyDetailHeaderDetailCell
        
        let storyDetailSocialShareCell = StoryDetailSocialShareCell.init(frame: CGRect.zero)
        sizingCells[reuseIdentifierStoryDetailSocialShareCell] = storyDetailSocialShareCell
        
        let storyDetailTextElementCell = StoryDetailTextElementCell.init(frame: CGRect.zero)
        sizingCells[reuseIdentifierStoryDetailTextElementCell] = storyDetailTextElementCell
        
        let storyDetailBackQuoteCell = StoryDetailBackQuoteCell.init(frame: CGRect.zero)
        sizingCells[reuseIdentifierStoryDetailBackQuoteCell] = storyDetailBackQuoteCell
        
        let storyDetailQuoteElementCell = StoryDetailQuoteElementCell.init(frame: CGRect.zero)
        sizingCells[reuseIdentifierStoryDetailQuoteElementCell] = storyDetailQuoteElementCell
        
        let storyDetailBlurbElementCell = StoryDetailBlurbElementCell.init(frame: CGRect.zero)
        sizingCells[reuseIdentifierStoryDetailBlurbElementCell] = storyDetailBlurbElementCell
        
        let storyDetailQnACell = StoryDetailQnAElementCell.init(frame: CGRect.zero)
        sizingCells[reuseIdentifierStoryDetailQnACell] = storyDetailQnACell
        
        let storyDetailBigFactElementCell = StoryDetailBigFactElementCell.init(frame: CGRect.zero)
        sizingCells[reuseIdentifierStoryDetailBigFactElementCell] = storyDetailBigFactElementCell
        
        let storyDetailAuthorElemenCell = StoryDetailAuthorElemenCell.init(frame: CGRect.zero)
        sizingCells[reuseIdentifierStoryDetailAuthorElemenCell] = storyDetailAuthorElemenCell
        
        let storyDetailsTagElementCell = StoryDetailsTagElementCell.init(frame: CGRect.zero)
        sizingCells[reuseIdentifierStoryDetailsTagElementCell] = storyDetailsTagElementCell
        
        
        loadData()
        
    }
    
    
    override func loadData() {
        
        //        utility.showActivityIndicatory(uiView: view)
        //        Quintype.api.getStoryFromSlug(slug: currentSlug!, cache: cacheOption.cacheToMemoryAndDiskWithTime(min: 5), Success: { (story) in
        //
        //            self.storyDetail = story!
        //
        //            print(self.storyDetail)
        //
        //
        //        }) { (error) in
        //
        //            print(error!)
        //
        //        }
        
    }
    
    
}
