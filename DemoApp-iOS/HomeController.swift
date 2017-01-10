//
//  HomeController.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/3/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit
import Quintype

private let reuseIdentifierHeaderCollectionCell = "headerCollectionCell"
private let reuseIdentifierDefaultStoryCollectionCell = "defaultStoryCell"

class HomeController: BaseController{
    
    let screen = UIScreen.main.bounds
    let itemSizeForPortraitMode = 100
    let itemSizeForLandscapeMode = 200
    var menu:[Menu]?
    var offset:Int = 0
    var limit:Int = 0
    
    //TODO: -remove the dummy values
    var section1 =  [1]
    var section2 = [1,2,3,4,5,6]
    var sizingCells:[String:BaseCollectionCell] = [:]
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
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": homeCollectionView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": homeCollectionView]))
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.backgroundColor = UIColor.white
        homeCollectionView.register(HeaderCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifierHeaderCollectionCell)
//        homeCollectionView.register(DefaultStoryCell.self, forCellWithReuseIdentifier: reuseIdentifierDefaultStoryCollectionCell)
        
        let sizingHeaderCell = HeaderCollectionCell.init(frame: CGRect.zero)
        sizingCells[reuseIdentifierHeaderCollectionCell] = sizingHeaderCell
        
//        let sizingDefaultStoryCell = DefaultStoryCell.init(frame: CGRect.zero)
//        sizingCells[reuseIdentifierDefaultStoryCollectionCell] = sizingDefaultStoryCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        initNavgationbarIcon()
        self.navigationItem.title = "..Home.."
        
        
        
        menu?.forEach({ (singleMenu) in
            
            if let slug =  singleMenu.section_slug{
                
                Quintype.api.getStories(options: storiesOption.section(sectionName: slug), fields: nil, offset: nil, limit: nil, storyGroup: nil, cache: cacheOption.cacheToMemoryAndDiskWithTime(min: 3), Success: { (data) in
                    
                    print(data as Any)
                    
                }, Error: { (error) in
                    
                    print(error as Any)
                    
                })
                
            }
            
        })
        
        
    }
    
    
    private func initNavgationbarIcon(){
        //TODO: - Error in click on search
        let rightSearchBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action:  #selector(searchTapped(sender:)))
        self.navigationItem.setRightBarButtonItems([rightSearchBarButtonItem], animated: true)
        
    }
    
    func searchTapped(sender:AnyObject){
        
    }
    
}



extension HomeController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell : UICollectionViewCell?
        
//        if indexPath.row == 0{
        
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierHeaderCollectionCell, for: indexPath)
            
            let currentCell = cell as?  HeaderCollectionCell
            
          
            
//        }else{
//             cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierDefaultStoryCollectionCell, for: indexPath)
//            
//            let currentCell = cell as? DefaultStoryCell
//            currentCell?.backgroundColor = .red
//        }
        return cell!
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        if section == 1{
//            
//            return 1
//            
//        }else{
//            
        return 10
        
//        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
      let targetSize =  CGSize(width: self.view.bounds.width, height: self.view.bounds.width)
        let sizingCell:BaseCollectionCell?

            sizingCell = sizingCells[reuseIdentifierHeaderCollectionCell]
            sizingCell?.configure(data:nil)
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
          // return targetSize
           return calculatedSize!
       
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //MARK: - Auto resize on rotation
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.view.layoutIfNeeded()
        let offset = homeCollectionView.contentOffset;
        let width  = homeCollectionView.bounds.size.width;
        let index     = round(offset.x / width);
        let newOffset = CGPoint(x: index * size.width, y: offset.y)
        
        coordinator.animate(alongsideTransition: { (context) in
            
            self.homeCollectionView.collectionViewLayout.invalidateLayout()
            //            self.homeCollectionView.setContentOffset(newOffset, animated: false)
            
        }, completion: nil)
    }
    
    //TODO: -Donot remove
    //
    //        override func viewWillLayoutSubviews() {
    //            super.viewWillLayoutSubviews()
    //            self.homeCollectionView.collectionViewLayout.invalidateLayout()
    //        }
    
    
}



