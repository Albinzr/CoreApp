////
////  StoryDetailLayoutEngine.swift
////  DemoApp-iOS
////
////  Created by Albin CR on 1/30/17.
////  Copyright © 2017 Albin CR. All rights reserved.
////
//
//import Foundation
//
//import Foundation
//import Quintype
//
//
//class StoryDetailLayoutEngine{
//    
//    var story:Story?
//
//    
//    public init(stories:Story){
//        
//        self.story = stories
//    }
//    
//    func makeLayouts(completion:@escaping (_ layouts:[[HomeLayout]]) -> Void){
//        
//        
//        let layouts = makeLayout(stories: self.story!)
//        completion(layouts)
//
//    }
//    
//    func makeLayout(stories:Story) -> [[HomeLayout]]{
//        var layoutEngineArray = [[HomeLayout]]()
//        var layoutArray = [HomeLayout]()
//        for (index,_) in story.enumerated(){
//            if index == 0{
//                let layout = HomeLayout(layoutType: .headerCollection)
//                layoutArray.append(layout)
//            }else{
//                let layout = HomeLayout(layoutType: .defaultCollection)
//                layoutArray.append(layout)
//            }
//        }
//        layoutEngineArray.append(layoutArray)
//        
//        return layoutEngineArray
//    }
//    
//}
