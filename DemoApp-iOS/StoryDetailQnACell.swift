//
//  StoryDetailQnACell.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/30/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation
import UIKit

class StoryDetailQnAElementCell:BaseCollectionCell{
    
    let questionTextElement:UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor.red
        label.text = "Where does it come from?"
        label.font = UIFont.systemFont(ofSize: 24)
        return label
        
    }()
    
    var answerTextElement:UITextView = {
        
        let textView = UITextView()
        textView.textContainerInset = UIEdgeInsets(top: 15 , left: 0, bottom: 0, right: 0)
        textView.textColor = .black
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.dataDetectorTypes = .link
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.text = "Where does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites"
        textView.textColor = .blue
        return textView
        
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        let view = self.contentView
        
        view.addSubview(questionTextElement)
        view.addSubview(answerTextElement)
        
        questionTextElement.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 15, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        answerTextElement.anchor(questionTextElement.bottomAnchor, left: questionTextElement.leftAnchor, bottom: view.bottomAnchor, right: questionTextElement.rightAnchor, topConstant: 15, leftConstant: 0, bottomConstant: 15, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        
        
    }
}
