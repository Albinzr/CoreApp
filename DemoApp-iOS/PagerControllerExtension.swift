//
//  HomeControllerExtension.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/12/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation
import UIKit

extension PagerController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell : UICollectionViewCell?

        switch self.layoutEngineArray[indexPath.section][indexPath.row].layoutType {
        case .headerCollection:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierHeaderCollectionCell, for: indexPath) as!HeaderCollectionCell
            let currentCell = cell as?  HeaderCollectionCell
            
            if storyCollectionArray.count > 0{
                
                currentCell?.configure(data:storyCollectionArray[indexPath.row])
            
            }
            
            break
        case .defaultCollection:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierDefaultStoryCollectionCell, for: indexPath)
            
            let currentCell = cell as? DefaultStoryCell
            
            if storyCollectionArray.count > 0{
                currentCell?.configure(data:storyCollectionArray[indexPath.row])
            }
            break
        }
        return cell!
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.layoutEngineArray[section].count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.layoutEngineArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch self.layoutEngineArray[indexPath.section][indexPath.row].layoutType {
        case .headerCollection:
            
            let targetSize =  CGSize(width: self.homeCollectionView.bounds.width, height: self.homeCollectionView.bounds.width)
            let sizingCell:BaseCollectionCell?
            sizingCell = sizingCells[reuseIdentifierHeaderCollectionCell]
            if storyCollectionArray.count > 0{
                sizingCell?.configure(data:storyCollectionArray[indexPath.row])
            }
            
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
            return calculatedSize!
        case .defaultCollection:
            
            let targetSize =  CGSize(width: self.homeCollectionView.bounds.width, height: self.homeCollectionView.bounds.width)
            let sizingCell:BaseCollectionCell?
            sizingCell = sizingCells[reuseIdentifierDefaultStoryCollectionCell]
            if storyCollectionArray.count > 0{
                sizingCell?.configure(data:storyCollectionArray[indexPath.row])
            }
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
            return calculatedSize!
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //MARK: - Auto resize on rotation
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        self.homeCollectionView.collectionViewLayout.invalidateLayout()
        self.homeCollectionView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        if(self.lastContentOffset > scrollView.contentOffset.y) &&
            self.lastContentOffset < (scrollView.contentSize.height - scrollView.frame.height) {
            // move up
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
        else if (self.lastContentOffset < scrollView.contentOffset.y
            && scrollView.contentOffset.y > 0) {
            // move down
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            
        }
        
        // update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.y
        
    }
    
    
}
