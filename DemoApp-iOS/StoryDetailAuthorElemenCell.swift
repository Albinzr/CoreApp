//
//  StoryDetailAuthorElemenCell.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/30/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit

class StoryDetailAuthorElemenCell: BaseCollectionCell {
    
    
    let authorImage:UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "video")
        return imageView
        
    }()
    
    let authorName:UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor.red
        label.text = "adsasdasd"
        return label
        
    }()
    
    
    
    override func setupViews() {
        super.setupViews()
        
        let view = self.contentView
        
        view.addSubview(authorImage)
        view.addSubview(authorName)
        
        authorImage.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: nil, topConstant: 15, leftConstant: 15, bottomConstant: 15, rightConstant: 0, widthConstant: 60, heightConstant: 60)
        
        authorName.anchor(authorImage.topAnchor, left: authorImage.rightAnchor, bottom: nil, right: view.rightAnchor, topConstant: 25, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        
    }
    
    
}
