//
//  CollectionViewCell.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/27/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit

class StoryDetailHeaderImageCell: BaseCollectionCell {
    
    var coverImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
        
        
    }()
    
    var alphaLayerForCoverImage:UIView = {
        
        let view = UIView()
        view.backgroundColor = Themes.DefaultThemes.storyDetailCells.homeHeaderImageCell.alphaLayerForCoverImageColor
        view.alpha = Themes.DefaultThemes.storyDetailCells.homeHeaderImageCell.opacityAlphaLayerForCoverImageColor
        return view
        
    }()
    
    var bottomStoryTextDescription:UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 4
        label.lineBreakMode = .byWordWrapping
        return label
        
        
    }()
    
    
    
    
    override func setupViews() {
        super.setupViews()
        
        
        self.contentView.addSubview(coverImageView)
        self.coverImageView.addSubview(alphaLayerForCoverImage)
        self.alphaLayerForCoverImage.addSubview(bottomStoryTextDescription)
        
        
        coverImageView.anchor(self.contentView.topAnchor, left: self.contentView.leftAnchor, bottom: self.contentView.bottomAnchor, right: self.contentView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 414)
        
        alphaLayerForCoverImage.fillSuperview()
        
        bottomStoryTextDescription.anchor(nil, left: self.alphaLayerForCoverImage.leftAnchor, bottom: self.alphaLayerForCoverImage.bottomAnchor, right: self.alphaLayerForCoverImage.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 15, rightConstant: 15, widthConstant: 0, heightConstant: 0)

        
        
    }
    
}
