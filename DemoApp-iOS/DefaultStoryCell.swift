//
//  DefaultStoryCell.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/9/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit

class DefaultStoryCell: BaseCollectionCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let coverView:UIView = {
        
        let view:UIView = UIView()
        view.backgroundColor = .green
        return view
        
    }()
    
    let headerImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    var date:UILabel = {
        
        let label = UILabel()
        label.textColor = Themes.DefaultThemes.HomeHeaderCell.dateColor
        label.text = "asdsad"
        return label
        
    }()
    
    var section:UILabel = {
        
        let label = UILabel()
        label.textColor = Themes.DefaultThemes.HomeHeaderCell.sectionTextColor
        label.text  = "asdasdasdasdasd"
        return label
        
    }()
    
    var border:UIView = {
        
        let view = UIView()
        view.backgroundColor = Themes.DefaultThemes.HomeHeaderCell.sectionUnderlineColor
        return view
        
    }()
    
    
    let storyheader:UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 3
        label.textAlignment = .justified
        label.textColor = Themes.DefaultThemes.HomeHeaderCell.storyHeaderColor
        return label
        
    }()
    
    let bottomSocialBar:UIView = {
        
        let view = UIView()
        return view
        
    }()
    
    var commentButton:UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(named: "video"), for: UIControlState.normal)
        return button
        
    }()
    
    var bookMarkButton:UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(named: "video"), for: UIControlState.normal)
        return button
        
    }()
    
    var shareButton:UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(named: "video"), for: UIControlState.normal)
        return button
        
    }()
    

    override func setupViews() {
        
    self.contentView.addSubview(coverView)
        self.coverView.addSubview(headerImageView)
        self.coverView.addSubview(section)
        self.section.addSubview(border)
        self.coverView.addSubview(date)
    
        
        coverView.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 15, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: self.commentButton.bounds.height)
        
        headerImageView.anchor(self.coverView.topAnchor, left: self.coverView.leftAnchor, bottom: nil, right: self.coverView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 300)
        headerImageView.backgroundColor = .yellow
        
        
        section.anchor(self.coverView.topAnchor, left: self.coverView.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
         border.anchor(nil, left: self.section.leftAnchor, bottom: self.section.bottomAnchor, right: self.section.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: section.bounds.width, heightConstant: Themes.DefaultThemes.HomeHeaderCell.sectionUnderlineHeight)
        
        date.anchor(self.coverView.topAnchor, left: nil, bottom: nil, right: self.coverView.rightAnchor, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
 
    }
    
    override func willTransition(from oldLayout: UICollectionViewLayout, to newLayout: UICollectionViewLayout) {
//        super.willTransition(from: oldLayout, to: newLayout)
//        self.layoutIfNeeded()
        newLayout.collectionView?.reloadData()
    }
}
