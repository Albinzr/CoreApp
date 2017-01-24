//
//  StoryDetailPager.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/23/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class StoryDetailPager: BaseController,IndicatorInfoProvider {
    
    let reuseIdentifierDefaultStoryCollectionCell = "defaultStoryCell"
    let screenSize = UIScreen.main.bounds
    
    convenience init(slug:String) {
        self.init()
        

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
        homeCollectionView.register(DefaultStoryCell.self, forCellWithReuseIdentifier: reuseIdentifierDefaultStoryCollectionCell)
        
    
    }

    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return ""
        
    }
  }
