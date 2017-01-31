//
//  StoryDetailQuoteElementCell.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/30/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit

class StoryDetailQuoteElementCell: BaseCollectionCell {
    
    
    
    
    var quoteImage:UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "video")
        return imageView
    }()
    
    var textElement:UITextView = {
        
        let textView = UITextView()
        textView.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        textView.textColor = .black
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.dataDetectorTypes = .link
        textView.text = "Where does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."
        return textView
        
    }()
    
    let authorName:UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor.red
        label.text = "adsasdasd"
        label.backgroundColor = UIColor.green
        label.numberOfLines = 1
        return label
        
    }()
    
    
    
    override func setupViews() {
        
        super.setupViews()
        
        let view = self.contentView
        
        
        view.addSubview(quoteImage)
        view.addSubview(textElement)
        view.addSubview(authorName)
        
        quoteImage.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 48, heightConstant: 48)
        
        textElement.anchor(view.topAnchor, left: quoteImage.rightAnchor, bottom: nil, right: view.rightAnchor, topConstant: 35, leftConstant: 10, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)

        authorName.anchor(textElement.bottomAnchor, left: textElement.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 15, leftConstant: 5, bottomConstant: 15, rightConstant:15, widthConstant: 0, heightConstant: 0)
        
        
    }
 
    
    
}
