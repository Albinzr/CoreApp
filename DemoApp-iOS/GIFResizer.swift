//
//  GifResizer.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/17/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation
import UIKit
import ImageIO
import MobileCoreServices

public class GIFResizer: NSObject {
    
    public class func calculateBestNewWidth(oldWidth: Int,
                                            oldSizeInBytes: Int,
                                            maxSizeInBytes: Int) -> Double {
        let ratioDiff = Double(maxSizeInBytes)/Double(oldSizeInBytes)
        return Double(oldWidth) * ( ratioDiff + ((1-ratioDiff)/3))
    }
    
    public class func resizeGIF(data:Data, fileURL:URL, maxEdgeSize:Double) -> Bool {
        let options = [kCGImageSourceShouldCache as String:false,
                       kCGImageSourceTypeIdentifierHint as String:kUTTypeGIF] as [String : Any]
        guard let imageSource = CGImageSourceCreateWithData(data as CFData, options as CFDictionary?) else {
            return false
        }
        let numberOfFrames = CGImageSourceGetCount(imageSource)
        
        guard let destination = CGImageDestinationCreateWithURL(fileURL as CFURL, kUTTypeGIF, numberOfFrames, nil) else {
            return false
        }
        let fileProperties = [kCGImagePropertyGIFDictionary as String:[kCGImagePropertyGIFLoopCount  as String:0]]
        CGImageDestinationSetProperties(destination, fileProperties as CFDictionary?)
        
        let newOptions = [kCGImageSourceShouldCache as String:false,
                          kCGImageSourceTypeIdentifierHint as String:kUTTypeGIF,
                          kCGImageSourceCreateThumbnailFromImageIfAbsent as String:true,
                          kCGImageSourceThumbnailMaxPixelSize as String:maxEdgeSize] as [String : Any]
        
        for index in 0..<numberOfFrames {
            autoreleasepool {
                let properties = CGImageSourceCopyPropertiesAtIndex(imageSource, index, nil)
                if let imageRef = CGImageSourceCreateThumbnailAtIndex(imageSource, index, newOptions as CFDictionary?) {
                    CGImageDestinationAddImage(destination, imageRef, properties)
                }
            }
        }
        
        if (!CGImageDestinationFinalize(destination)) {
            NSLog("failed to finalize image destination");
            return false
        }
        return true
    }
}
