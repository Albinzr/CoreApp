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
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data:Any?){
        
    }
    
    func calculateHeight(targetSize:CGSize) -> CGSize{
        
        var newSize = targetSize
        newSize.width = targetSize.width
        
        let widthConstraint = NSLayoutConstraint(item: self.contentView,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1,
                                                 constant:newSize.width)
        
        contentView.addConstraint(widthConstraint)
//        self.setNeedsUpdateConstraints()
//        self.updateConstraintsIfNeeded()
//        self.setNeedsLayout()
//        self.layoutIfNeeded()
//        
        var size = UILayoutFittingCompressedSize
        size.width = newSize.width
        
        let cellSize = self.contentView.systemLayoutSizeFitting(size, withHorizontalFittingPriority: 1000, verticalFittingPriority:1)
        contentView.removeConstraint(widthConstraint)
        
        return cellSize
        
    }
    
    public func setupViews(){
        
    }
}
