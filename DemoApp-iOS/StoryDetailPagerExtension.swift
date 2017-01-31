//
//  StoryDetailPagerExtension.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/23/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//


import Foundation
import UIKit

extension StoryDetailPager:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    // MARK: UICollectionViewDataSource
    
    // MARK: - Section in cell
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //MARK: - Collection count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 11
    }
    
    //MARK: - Data -
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell?
        
        if indexPath.row == 0{
            
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierStoryHeaderImageCell, for: indexPath as IndexPath)
            
        }else if indexPath.row == 1{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierStoryHeaderDetailCell, for: indexPath as IndexPath)
            
        }else if indexPath.row == 2{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierStoryDetailSocialShareCell, for: indexPath as IndexPath)
            
        } else if indexPath.row == 3{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierStoryDetailTextElementCell, for: indexPath as IndexPath)

        }else if indexPath.row == 4{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierStoryDetailBackQuoteCell, for: indexPath as IndexPath)
            
        }else if indexPath.row == 5{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierStoryDetailQuoteElementCell, for: indexPath as IndexPath)
            
        }else if indexPath.row == 6{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierStoryDetailBlurbElementCell, for: indexPath as IndexPath)
            
        }else if indexPath.row == 7{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierStoryDetailQnACell, for: indexPath as IndexPath)
           
        }else if indexPath.row == 8{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierStoryDetailBigFactElementCell, for: indexPath as IndexPath)
           
        }else if indexPath.row == 9{
             cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierStoryDetailAuthorElemenCell, for: indexPath as IndexPath)
            
        }else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierStoryDetailsTagElementCell, for: indexPath as IndexPath)
         
        }
        return cell!
        
    }
    // MARK: - Bottom Space -
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 0{
            
            let targetSize =  CGSize(width: self.homeCollectionView.bounds.width, height: self.homeCollectionView.bounds.width)
            let sizingCell:BaseCollectionCell?
            sizingCell = sizingCells[reuseIdentifierStoryHeaderImageCell]
            
            sizingCell?.configure(data:nil)
            
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
            return calculatedSize!
            
        }else if indexPath.row == 1{
            
            let targetSize =  CGSize(width: self.homeCollectionView.bounds.width, height: self.homeCollectionView.bounds.width)
            let sizingCell:BaseCollectionCell?
            sizingCell = sizingCells[reuseIdentifierStoryHeaderDetailCell]
            
            sizingCell?.configure(data:nil)
            
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
            return calculatedSize!
            
        }else if indexPath.row == 2{
            
            let targetSize =  CGSize(width: self.homeCollectionView.bounds.width, height: self.homeCollectionView.bounds.width)
            let sizingCell:BaseCollectionCell?
            sizingCell = sizingCells[reuseIdentifierStoryDetailSocialShareCell]
            
            sizingCell?.configure(data:nil)
            
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
            return calculatedSize!
            
        }else if indexPath.row == 3{
            
            let targetSize =  CGSize(width: self.homeCollectionView.bounds.width, height: self.homeCollectionView.bounds.width)
            let sizingCell:BaseCollectionCell?
            sizingCell = sizingCells[reuseIdentifierStoryDetailTextElementCell]
            
            sizingCell?.configure(data:nil)
            
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
            return calculatedSize!
            
            
        }else if indexPath.row == 4{
            
            let targetSize =  CGSize(width: self.homeCollectionView.bounds.width, height: self.homeCollectionView.bounds.width)
            let sizingCell:BaseCollectionCell?
            sizingCell = sizingCells[reuseIdentifierStoryDetailBackQuoteCell]
            
            sizingCell?.configure(data:nil)
            
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
            return calculatedSize!
            
            
        }else if indexPath.row == 5{
            
            let targetSize =  CGSize(width: self.homeCollectionView.bounds.width, height: self.homeCollectionView.bounds.width)
            let sizingCell:BaseCollectionCell?
            sizingCell = sizingCells[reuseIdentifierStoryDetailQuoteElementCell]
            
            sizingCell?.configure(data:nil)
            
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
            return calculatedSize!
            
            
        }else if indexPath.row == 6{
            
            let targetSize =  CGSize(width: self.homeCollectionView.bounds.width, height: self.homeCollectionView.bounds.width)
            let sizingCell:BaseCollectionCell?
            sizingCell = sizingCells[reuseIdentifierStoryDetailBlurbElementCell]
            
            sizingCell?.configure(data:nil)
            
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
            return calculatedSize!
            
            
        }
        else if indexPath.row == 7{
            
            let targetSize =  CGSize(width: self.homeCollectionView.bounds.width, height: self.homeCollectionView.bounds.width)
            let sizingCell:BaseCollectionCell?
            sizingCell = sizingCells[reuseIdentifierStoryDetailQnACell]
            
            sizingCell?.configure(data:nil)
            
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
            return calculatedSize!
            
            
        }
        else if indexPath.row == 8{
            
            let targetSize =  CGSize(width: self.homeCollectionView.bounds.width, height: self.homeCollectionView.bounds.width)
            let sizingCell:BaseCollectionCell?
            sizingCell = sizingCells[reuseIdentifierStoryDetailBigFactElementCell]
            
            sizingCell?.configure(data:nil)
            
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
            return calculatedSize!
            
            
        }else if indexPath.row == 9{
            
            let targetSize =  CGSize(width: self.homeCollectionView.bounds.width, height: self.homeCollectionView.bounds.width)
            let sizingCell:BaseCollectionCell?
            sizingCell = sizingCells[reuseIdentifierStoryDetailAuthorElemenCell]
            
            sizingCell?.configure(data:nil)
            
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
            return calculatedSize!
            
            
        }else {
            
            let targetSize =  CGSize(width: self.homeCollectionView.bounds.width, height: self.homeCollectionView.bounds.width)
            let sizingCell:BaseCollectionCell?
            sizingCell = sizingCells[reuseIdentifierStoryDetailsTagElementCell]
            
//            sizingCell?.configure(data:nil)
            
            let calculatedSize = sizingCell?.calculateHeight(targetSize: targetSize)
            return calculatedSize!
            
        }
//
    }
    
    // MARK: - Selecting cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
}
