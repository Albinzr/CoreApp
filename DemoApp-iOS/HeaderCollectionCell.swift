//
//  HeaderCollectionCell.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/6/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//





import UIKit
import Quintype


enum imageType:String{
    
    case webp = "webp"
    case gif = "gif"
    
    
}


// Then pass it to the `setImage` methods:

class HeaderCollectionCell: BaseCollectionCell {
    
    let imageBaseUrl = "http://" + (Quintype.publisherConfig?.cdn_image)! + "/"
    
    override func configure(data: Any?) {

        if let story = data as? Story{
    
            if let header = story.headline{ self.storyHeader.text = header }
            if let storySection = story.sections[0].name{ self.section.text = storySection }
            if let publishedDate = story.first_published_at{ self.date.text = publishedDate.convertTimeStampToDate }
            if let coverImage = story.hero_image_s3_key{
                
             self.coverImageView.loadImage(url: imageBaseUrl + coverImage, targetSize: CGSize(width: self.coverImageView.bounds.width, height: self.coverImageView.bounds.height))
                
            }
        }
    }
    
    
    var coverImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    var alphaLayerForCoverImage:UIView = {
        let view = UIView()
        view.backgroundColor = Themes.DefaultThemes.homePageCells.HomeHeaderCell.alphaLayerForCoverImageColor
        view.alpha = Themes.DefaultThemes.homePageCells.HomeHeaderCell.opacityAlphaLayerForCoverImageColor
        return view
    }()
    
    var bottomSocialBar:UIView = {
        
        let view = UIView()
        return view
        
    }()
    
    var sepratingBar:UIView = {
        
        let view = UIView()
        view.backgroundColor = Themes.DefaultThemes.homePageCells.HomeHeaderCell.socialSepratorLineColor
        
        return view
        
    }()
    
    var date:UILabel = {
        
        let label = UILabel()
        label.textColor = Themes.DefaultThemes.homePageCells.HomeHeaderCell.dateColor
        return label
        
    }()
    
    var section:UILabel = {
        
        let label = UILabel()
        label.textColor = Themes.DefaultThemes.homePageCells.HomeHeaderCell.sectionTextColor
        return label
        
    }()
    
    var storyHeader:UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = Themes.DefaultThemes.homePageCells.HomeHeaderCell.storyHeaderColor
        return label
        
    }()
    
    var border:UIView = {
        
        let view = UIView()
        view.backgroundColor = Themes.DefaultThemes.homePageCells.HomeHeaderCell.sectionUnderlineColor
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
        
        self.contentView.addSubview(coverImageView)
        self.coverImageView.addSubview(alphaLayerForCoverImage)
        self.contentView.addSubview(bottomSocialBar)
        self.contentView.addSubview(sepratingBar)
        self.contentView.addSubview(storyHeader)
        self.contentView.addSubview(section)
        self.section.addSubview(border)
        self.contentView.addSubview(date)
        self.bottomSocialBar.addSubview(commentButton)
        self.bottomSocialBar.addSubview(bookMarkButton)
        self.bottomSocialBar.addSubview(shareButton)
        

        coverImageView.anchor(self.contentView.topAnchor, left: self.contentView.leftAnchor, bottom: self.contentView.bottomAnchor, right: self.contentView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 414)
        
        alphaLayerForCoverImage.fillSuperview()
        
        bottomSocialBar.anchor(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 15, rightConstant: 15, widthConstant: 0, heightConstant: 40)
        
        sepratingBar.anchor(nil, left: self.leftAnchor, bottom: self.bottomSocialBar.topAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 1)
        
        storyHeader.anchor(nil, left: self.leftAnchor, bottom: self.sepratingBar.topAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 15, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        section.anchor(nil, left: self.leftAnchor, bottom: storyHeader.topAnchor, right: nil, topConstant: 0, leftConstant: 15, bottomConstant: 10, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        border.anchor(nil, left: self.section.leftAnchor, bottom: self.section.bottomAnchor, right: self.section.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: -2, rightConstant: 0, widthConstant: section.bounds.width, heightConstant: Themes.DefaultThemes.homePageCells.HomeHeaderCell.sectionUnderlineHeight)
        
        date.anchor(nil, left: nil, bottom: self.storyHeader.topAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 15, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        commentButton.anchor(self.bottomSocialBar.topAnchor, left: self.bottomSocialBar.leftAnchor, bottom: self.bottomSocialBar.bottomAnchor, right: nil, topConstant: 5, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        bookMarkButton.anchor(self.bottomSocialBar.topAnchor, left: self.commentButton.rightAnchor, bottom: self.bottomSocialBar.bottomAnchor, right: nil, topConstant: 5, leftConstant: 15, bottomConstant: 5, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        shareButton.anchor(self.bottomSocialBar.topAnchor, left: self.bookMarkButton.rightAnchor, bottom: self.bottomSocialBar.bottomAnchor, right: nil, topConstant: 5, leftConstant: 15, bottomConstant: 5, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        
        
    }
    
}
