//
//  StoryDetailBlurbElementCell.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/30/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit

class StoryDetailBlurbElementCell: BaseCollectionCell {
    
    var textElement:UITextView = {
        
        let textView = UITextView()
        textView.textContainerInset = UIEdgeInsets(top: 15 , left: 15, bottom: 15, right: 15)
        textView.backgroundColor = UIColor.lightGray
        textView.textColor = .black
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.dataDetectorTypes = .link
        textView.font = UIFont.systemFont(ofSize: 24)
        textView.text = "Where does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites"
        textView.textColor = .blue
        return textView
        
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        let view = self.contentView
        
        view.addSubview(textElement)
        
        textElement.fillSuperview()
        
    }
    
}
