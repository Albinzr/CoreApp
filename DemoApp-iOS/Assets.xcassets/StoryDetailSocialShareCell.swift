//
//  StoryDetailSocialShareCell.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/30/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit

class StoryDetailSocialShareCell: BaseCollectionCell {
    
    let authorName:UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor.red
        label.text = "adsasdasd"
        return label
        
    }()
    
    let authorNameSeprator:UIView = {
        
        let view = UIView()
        view.backgroundColor = .red
        return view
        
    }()
    
    let publishedDate:UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor.red
        label.text = "88-88-8888"
        return label
        
    }()
    
    let publishedDateSeprator:UIView = {
        
        let view = UIView()
        view.backgroundColor = .red
        return view
        
    }()
    
    let facebookShareIcon:UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(named:"video"), for: UIControlState.normal)
        return button
        
        
    }()
    
    let twitterShareIcon:UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(named:"video"), for: UIControlState.normal)
        return button
        
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        let view = self.contentView
        
        view.addSubview(authorName)
        view.addSubview(authorNameSeprator)
        view.addSubview(publishedDate)
        view.addSubview(publishedDateSeprator)
        view.addSubview(facebookShareIcon)
        view.addSubview(twitterShareIcon)
        
        
        authorName.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: nil, topConstant: 15, leftConstant: 15, bottomConstant: 15, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        authorNameSeprator.anchor(view.topAnchor, left: authorName.rightAnchor, bottom: view.bottomAnchor, right: nil, topConstant: 15, leftConstant: 15, bottomConstant: 15, rightConstant: 0, widthConstant: 1, heightConstant: 0)
        
        publishedDate.anchor(view.topAnchor, left: authorNameSeprator.rightAnchor, bottom: view.bottomAnchor, right: nil, topConstant: 15, leftConstant: 15, bottomConstant: 15, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        publishedDateSeprator.anchor(view.topAnchor, left: publishedDate.rightAnchor, bottom: view.bottomAnchor, right: nil, topConstant: 15, leftConstant: 15, bottomConstant: 15, rightConstant: 0, widthConstant: 1, heightConstant: 0)
        
        facebookShareIcon.anchor(view.topAnchor, left: publishedDateSeprator.rightAnchor, bottom: view.bottomAnchor, right: nil, topConstant: 15, leftConstant: 15, bottomConstant: 15, rightConstant: 0, widthConstant: 21, heightConstant: 0)
       
        twitterShareIcon.anchor(view.topAnchor, left: facebookShareIcon.rightAnchor, bottom: view.bottomAnchor, right: nil, topConstant: 15, leftConstant: 15, bottomConstant: 15, rightConstant: 0, widthConstant: 21, heightConstant: 0)
        
        
    }
    
    
    
}
