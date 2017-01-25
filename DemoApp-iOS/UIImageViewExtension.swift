//
//  UIImageViewExtension.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/19/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import KingfisherWebP

extension UIImageView{
    
    public func loadImage(url:String,targetSize:CGSize,placeholder:UIImage? = nil,animation:ImageTransition = .none){
        let url = url.replacingOccurrences(of: " ", with: "%20")
        let convertedUrl = URL(string: url)
        
        if let mineType = url.components(separatedBy: ".").last?.lowercased(){
            
            switch mineType{
                
            case imageType.gif.rawValue :
                self.kf.indicatorType = .activity
                self.kf.setImage(with: convertedUrl, options: [.transition(animation)], completionHandler: { (image, error, cache, url) in
                    
       
                    
                })
                
                break
                
            case imageType.webp.rawValue :
                self.kf.setImage(with: convertedUrl, options: [.processor(WebPProcessor.default), .cacheSerializer(WebPSerializer.default)], completionHandler: { (image, error, cache, url) in
                    
       
                    
                })
                break
                
            default:
                let resize = ResizingImageProcessor(targetSize: targetSize)
                self.kf.indicatorType = .activity
                self.kf.setImage(with: convertedUrl, placeholder: placeholder, options: [.transition(animation),.processor(resize)], completionHandler: { (image, error, cache, url) in
                    

                    
                })
                
                break
                
                
            }
        }
    }
}

extension UIViewController{
    
    public func clearUnusedImagesfromCache(){
        
        ImageCache.default.clearMemoryCache()
        ImageCache.default.cleanExpiredDiskCache()
    }
    
}
