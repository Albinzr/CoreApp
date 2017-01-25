//
//  StoryDetailPager.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/23/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit

class StoryDetailPager: BaseController {
    
    let reuseIdentifierDefaultStoryCollectionCell = "defaultStoryCell"
    let screenSize = UIScreen.main.bounds
    var pageIndex:Int?
    var currentSlug:String?
    
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
        homeCollectionView.register(DefaultStoryCell.self, forCellWithReuseIdentifier: reuseIdentifierDefaultStoryCollectionCell)
        
        
        
    }
    

}
