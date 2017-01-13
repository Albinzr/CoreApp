//
//  HomeControllerExtension.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/12/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation
import UIKit

extension HomeController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell : UICollectionViewCell?
        
        if indexPath.row == 0{
            
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierHeaderCollectionCell, for: indexPath) as!HeaderCollectionCell
            let currentCell = cell as?  HeaderCollectionCell
            
            if storyCollectionArray.count > 0{
                
                currentCell?.configure(data:storyCollectionArray[0]?[indexPath.row])
            }
            
        }else{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierDefaultStoryCollectionCell, for: indexPath)
            
            let currentCell = cell as? DefaultStoryCell
            
            if storyCollectionArray.count > 0{
                currentCell?.configure(data:storyCollectionArray[0]?[indexPath.row])
            }
        }
        return cell!
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 0{
            let targetSize =  CGSize(width: self.homeCollectionView.bounds.width, height: self.homeCollectionView.bounds.width)
            let sizingCell:BaseCollectionCell?
            sizingCell = sizingCells[reuseIdentifierHeaderCollectionCell]
            if storyCollectionArray.count > 0{
                sizingCell?.configure(data:storyCollectionArray[0]?[indexPath.row])
            }
            
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
            return calculatedSize!
            
        }else{
            let targetSize =  CGSize(width: self.homeCollectionView.bounds.width, height: self.homeCollectionView.bounds.width)
            let sizingCell:BaseCollectionCell?
            sizingCell = sizingCells[reuseIdentifierDefaultStoryCollectionCell]
            if storyCollectionArray.count > 0{
                sizingCell?.configure(data:storyCollectionArray[0]?[indexPath.row])
            }
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
            return calculatedSize!
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    //MARK: - Auto resize on rotation
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        self.homeCollectionView.collectionViewLayout.invalidateLayout()
        self.homeCollectionView.reloadData()
    }
    
}
