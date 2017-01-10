//
//  BaseCollectionCell.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/9/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func configure(data:Any?){
    
    }
    
    func calculateHeight(targetSize:CGSize) -> CGSize{
    
        let widhtConstraint = NSLayoutConstraint.init(item: self.contentView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: targetSize.width)
        widhtConstraint.priority = 990
        self.contentView.addConstraint(widhtConstraint)
        self.contentView.setNeedsUpdateConstraints()
        self.contentView.updateConstraintsIfNeeded()
        self.contentView.setNeedsLayout()
        self.contentView.layoutIfNeeded()
        var changeSize = UILayoutFittingCompressedSize
        changeSize.width = targetSize.width
        let contentSize = self.contentView.systemLayoutSizeFitting(changeSize, withHorizontalFittingPriority: 1000, verticalFittingPriority: 250)
        self.contentView.removeConstraint(widhtConstraint)
        return contentSize
    }
    
    public func setupViews(){
        
    }
}
