//
//  HeaderCollectionCell.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/6/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit

class HeaderCollectionCell: BaseCollectionCell {
    
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure(data: Any?) {
        
        self.coverImageView.image = UIImage(named: "video")
        self.storyHeader.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"
        self.section.text = "adsadasdasdasd"
        self.date.text = "27-10-1993"
    }
    
    
    var coverImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var alphaLayerForCoverImage:UIView = {
        let view = UIView()
        view.backgroundColor = Themes.DefaultThemes.HomeHeaderCell.alphaLayerForCoverImageColor
        view.alpha = Themes.DefaultThemes.HomeHeaderCell.opacityAlphaLayerForCoverImageColor
        return view
    }()
    
    var bottomSocialBar:UIView = {
        
        let view = UIView()
        return view
        
    }()
    
    var sepratingBar:UIView = {
        
        let view = UIView()
        view.backgroundColor = Themes.DefaultThemes.HomeHeaderCell.socialSepratorLineColor
    
        return view
        
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
    
    var storyHeader:UILabel = {
       
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = Themes.DefaultThemes.HomeHeaderCell.storyHeaderColor
        return label
        
    }()
    
    var border:UIView = {
        
        let view = UIView()
        view.backgroundColor = Themes.DefaultThemes.HomeHeaderCell.sectionUnderlineColor
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
        
//        self.contentView.addSubview(coverImageView)
        self.contentView.addSubview(alphaLayerForCoverImage)
        self.contentView.addSubview(bottomSocialBar)
        self.contentView.addSubview(sepratingBar)
        self.contentView.addSubview(storyHeader)
        self.contentView.addSubview(section)
        self.section.addSubview(border)
        self.contentView.addSubview(date)
        self.bottomSocialBar.addSubview(commentButton)
        self.bottomSocialBar.addSubview(bookMarkButton)
        self.bottomSocialBar.addSubview(shareButton)
        
        
        
//        coverImageView.fillSuperview()
//        
//        coverImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        
        alphaLayerForCoverImage.fillSuperview()
        
        bottomSocialBar.anchor(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 8, rightConstant: 15, widthConstant: 0, heightConstant: 40)
    
        sepratingBar.anchor(nil, left: self.leftAnchor, bottom: self.bottomSocialBar.topAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 1)
        
        storyHeader.anchor(nil, left: self.leftAnchor, bottom: self.sepratingBar.topAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 15, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        section.anchor(nil, left: self.leftAnchor, bottom: storyHeader.topAnchor, right: nil, topConstant: 0, leftConstant: 15, bottomConstant: 10, rightConstant: 0, widthConstant: 0, heightConstant: 0)
       
        border.anchor(nil, left: self.section.leftAnchor, bottom: self.section.bottomAnchor, right: self.section.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: section.bounds.width, heightConstant: Themes.DefaultThemes.HomeHeaderCell.sectionUnderlineHeight)
        
        date.anchor(nil, left: nil, bottom: self.storyHeader.topAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 15, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        commentButton.anchor(self.bottomSocialBar.topAnchor, left: self.bottomSocialBar.leftAnchor, bottom: self.bottomSocialBar.bottomAnchor, right: nil, topConstant: 5, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        bookMarkButton.anchor(self.bottomSocialBar.topAnchor, left: self.commentButton.rightAnchor, bottom: self.bottomSocialBar.bottomAnchor, right: nil, topConstant: 5, leftConstant: 15, bottomConstant: 5, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        shareButton.anchor(self.bottomSocialBar.topAnchor, left: self.bookMarkButton.rightAnchor, bottom: self.bottomSocialBar.bottomAnchor, right: nil, topConstant: 5, leftConstant: 15, bottomConstant: 5, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        
    }
    
}
