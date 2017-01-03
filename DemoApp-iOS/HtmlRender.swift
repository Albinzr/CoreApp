//
//  HtmlRender.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/2/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation
import UIKit

//extension Data {
//    var attributedString: NSAttributedString? {
//        do {
//            return try NSAttributedString(data: self, options:[NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
//        } catch let error as NSError {
//           //print(error.localizedDescription)
//        }
//        return nil
//    }
//}
//extension String {
//    var utf8Data: Data? {
//        return data(using: .utf8)
//    }
//}
//extension String
//{
//    func getAttributedStringFromHTMLString() -> NSAttributedString
//    {
//        do {
//            let attributedString = try NSAttributedString(data: self.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType], documentAttributes: nil)
//            return attributedString
//        } catch {
//           //print(error)
//            return NSAttributedString()
//        }
//    }
//}
//
//extension NSAttributedString
//{
//    func getHTMLString() -> String
//    {
//        var htmlText = "";
//        let documentAttributes = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType]
//        do {
//            let htmlData = try self.data(from: NSMakeRange(0, self.length), documentAttributes:documentAttributes)
//            if let htmlString = String(data:htmlData, encoding:String.Encoding.utf8) {
//                htmlText = htmlString
//            }
//            return htmlText
//        }
//        catch {
//           //print("error creating HTML from Attributed String")
//            return ""
//        }
//    }
//}
