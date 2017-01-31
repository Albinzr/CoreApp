//
//  StoryHeaderDetailCell.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/30/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit

class StoryDetailHeaderDetailCell: BaseCollectionCell {
    
    
    
    var headingText:UILabel = {
        
        let label = UILabel()
        label.textColor = Themes.DefaultThemes.storyDetailCells.StoryHeaderDetailCell.headerFontColor
        label.font = .systemFont(ofSize: Themes.DefaultThemes.storyDetailCells.StoryHeaderDetailCell.headerFontSize)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "asdasdsa asdasd asdas"
        return label
        
    }()
    
    var shortDescription:UILabel = {
        
        let label = UILabel()
        label.textColor = Themes.DefaultThemes.storyDetailCells.StoryHeaderDetailCell.shortDescriptionColor
        label.font = .systemFont(ofSize: Themes.DefaultThemes.storyDetailCells.StoryHeaderDetailCell.shortDescriptionFont)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "asdsad asdsad as das d as d as das d sa d as d sa d asd asdasdsadsa d asd as dasdsadasdas d ass d as"
        return label
        
    }()
    
    
    override func setupViews() {
        super.setupViews()
        self.contentView.addSubview(headingText)
        self.contentView.addSubview(shortDescription)
        
        let view = self.contentView
        
        headingText.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 15, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        shortDescription.anchor(headingText.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 15, leftConstant: 15, bottomConstant: 15, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
    }
    
}
