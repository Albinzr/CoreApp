//
//  DefaultStoryCell.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/9/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit
import Quintype

class DefaultStoryCell: BaseCollectionCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func configure(data: Any?) {
        
        self.headerImageView.image = UIImage(named: "video")
        
        if let story = data as? Story{
            
            if let header = story.headline{ self.storyheader.text = header }
            if let storySection = story.sections[0].name{ self.section.text = storySection }
            if let publishedDate = story.first_published_at{ self.date.text = publishedDate.convertTimeStampToDate }
            //            if let coverImage = story.
            
            
        }
    }
    
    let coverView:UIView = {
        
        let view:UIView = UIView()
        view.layer.cornerRadius = 15
        view.layer.borderColor = Themes.DefaultThemes.HomeHeaderCell.cellBorder
        view.layer.borderWidth = 1
        return view
        
    }()
    
    
    let imageCoverView:UIView = {
        
        let view:UIView = UIView()
        view.backgroundColor = Themes.DefaultThemes.HomeHeaderCell.alphaLayerForCoverImageColor
        view.backgroundColor = .black
        view.alpha = 0.2
        return view
        
    }()
    
    let headerImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    var date:UILabel = {
        
        let label = UILabel()
        label.textColor = Themes.DefaultThemes.HomeHeaderCell.dateColor
        return label
        
    }()
    
    var section:UILabel = {
        
        let label = UILabel()
        label.textColor = Themes.DefaultThemes.HomeHeaderCell.sectionTextColor
        return label
        
    }()
    
    var border:UIView = {
        
        let view = UIView()
        view.backgroundColor = Themes.DefaultThemes.HomeHeaderCell.sectionUnderlineColor
        return view
        
    }()
    
    
    let storyheader:UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = Themes.DefaultThemes.HomeHeaderCell.storyHeaderColor
        return label
        
    }()
    
    let bottomSocialBar:UIView = {
        
        let view = UIView()
        return view
        
    }()
    
    var sepratingBar:UIView = {
        
        let view = UIView()
        view.backgroundColor = Themes.DefaultThemes.HomeHeaderCell.socialSepratorLineColor
        
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
        self.headerImageView.addSubview(imageCoverView)
        self.headerImageView.addSubview(section)
        self.headerImageView.addSubview(border)
        self.headerImageView.addSubview(date)
        self.coverView.addSubview(storyheader)
        self.coverView.addSubview(bottomSocialBar)
        self.coverView.addSubview(sepratingBar)
        self.bottomSocialBar.addSubview(commentButton)
        self.bottomSocialBar.addSubview(bookMarkButton)
        self.bottomSocialBar.addSubview(shareButton)
        
        
        
        
        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect:self.imageCoverView.bounds, byRoundingCorners:[.topRight, .topLeft], cornerRadii: CGSize(width: 15, height: 15))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            self.imageCoverView.layer.mask = maskLayer
            
        }

        
        coverView.anchor(self.contentView.topAnchor, left: self.contentView.leftAnchor, bottom: self.contentView.bottomAnchor, right: self.contentView.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        headerImageView.anchor(self.coverView.topAnchor, left: self.coverView.leftAnchor, bottom:  nil, right: self.coverView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 300)
        
        self.imageCoverView.anchor(self.coverView.topAnchor, left: self.coverView.leftAnchor, bottom:  nil, right: self.coverView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 300)
        
        section.anchor(self.coverView.topAnchor, left: self.coverView.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        border.anchor(nil, left: self.section.leftAnchor, bottom: self.section.bottomAnchor, right: self.section.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: -2, rightConstant: 0, widthConstant: section.bounds.width, heightConstant: Themes.DefaultThemes.HomeHeaderCell.sectionUnderlineHeight)
        
        date.anchor(self.coverView.topAnchor, left: nil, bottom: nil, right: self.coverView.rightAnchor, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        storyheader.anchor(self.headerImageView.bottomAnchor, left: self.coverView.leftAnchor, bottom: self.bottomSocialBar.topAnchor, right: self.coverView.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        bottomSocialBar.anchor(self.storyheader.bottomAnchor, left: self.coverView.leftAnchor, bottom: self.coverView.bottomAnchor, right: self.coverView.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 40)
        
        
        sepratingBar.anchor(nil, left: self.leftAnchor, bottom: self.bottomSocialBar.topAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 1)
        
        commentButton.anchor(self.bottomSocialBar.topAnchor, left: self.bottomSocialBar.leftAnchor, bottom: self.bottomSocialBar.bottomAnchor, right: nil, topConstant: 5, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        bookMarkButton.anchor(self.bottomSocialBar.topAnchor, left: self.commentButton.rightAnchor, bottom: self.bottomSocialBar.bottomAnchor, right: nil, topConstant: 5, leftConstant: 15, bottomConstant: 5, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        shareButton.anchor(self.bottomSocialBar.topAnchor, left: self.bookMarkButton.rightAnchor, bottom: self.bottomSocialBar.bottomAnchor, right: nil, topConstant: 5, leftConstant: 15, bottomConstant: 5, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        

    
        
    }
    
}
