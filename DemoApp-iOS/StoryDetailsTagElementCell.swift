//
//  StoryDetailstagElementCell.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/30/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit

class StoryDetailsTagElementCell: BaseCollectionCell {
    
    
    
    var tagLabel:UILabel = {
        
        let label = UILabel()
        label.text = "Label"
        label.backgroundColor = UIColor.brown
        return label
        
    }()
    
    
    
    var tags = ["asdddd","dgdf","sdfsdfsdfsdfsd","sdfsd","sdfsdfwewrr","fgdf","dfg","dewfyhf","dgdf","dasdasasd","asdddd","dgdfz"]
    
    
    override func calculateHeight(targetSize: CGSize) -> CGSize {
        let size = super.calculateHeight(targetSize: targetSize)
        print("autolayout size:\(size)")
        
        if let  lastButton = self.contentView.viewWithTag(200) as? UIButton{
            lastButton.layoutIfNeeded()
            print("last button frame : \(lastButton.frame.origin.y + lastButton.frame.size.height)")
        }
        return size
    }
    
    override func setupViews() {
        super.setupViews()
        
        let view = self.contentView
        view.backgroundColor = .red
        let screenWidth:CGFloat = view.bounds.width - 8
        var usableWidth:CGFloat = 0
        var yPos:CGFloat =  15 + 21
        var xPos:CGFloat = 10
        let buttonSpacing:CGFloat = 5
        let totalButtonInset:CGFloat = 10
        let tagButtonHeight:CGFloat = 21
        let verticalButtonSpacing = tagButtonHeight + buttonSpacing
        var totalViewHeight:CGFloat = verticalButtonSpacing

        for (index,tag) in tags.enumerated(){
            
            let button = UIButton()
            view.addSubview(button)
            
            let buttonWidth = tag.getWidthOfString(with: UIFont.systemFont(ofSize: 12)) + totalButtonInset
            if (usableWidth < screenWidth) && (usableWidth + buttonWidth < screenWidth) {
                
                usableWidth = usableWidth + buttonWidth + buttonSpacing
                button.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: yPos, leftConstant: xPos, bottomConstant: 0, rightConstant: 0, widthConstant: buttonWidth, heightConstant: 21)
                button.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
                button.setTitle(tag, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
                button.backgroundColor = UIColor.lightGray
                xPos = xPos + buttonWidth + buttonSpacing
                
                
            }else{
                
                totalViewHeight = totalViewHeight + verticalButtonSpacing
                usableWidth = buttonWidth + buttonSpacing
                yPos =  yPos + tagButtonHeight + buttonSpacing
                xPos = 10
                button.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: yPos, leftConstant: xPos, bottomConstant: 0, rightConstant: 0, widthConstant: buttonWidth, heightConstant: 21)
                button.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
                button.setTitle(tag, for: .normal)
                button.backgroundColor = UIColor.red
                button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
                xPos = xPos + buttonWidth + buttonSpacing
                view.addSubview(button)
                
                
            }
            
            
            if index == tags.count - 1{

                
                button.tag = 200
               let bottomConstrain =  NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -20)
//
                view.addConstraint(bottomConstrain)
                
                print(button.frame.origin.y + button.frame.height)
                
            }
        }
        

        
    }
    
    
}
