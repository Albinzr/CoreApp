//
//  PagerLayout.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/20/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//


import Foundation
import Quintype

struct Layout{
    
    public enum LayoutType : String{
        case headerCollection =  "headerCollectionCell"
        case defaultCollection =  "defaultStoryCell"
    }
    
//    var story:Story
    var layoutType:LayoutType
    
    public init(layoutType:LayoutType){
//        self.story = story
        self.layoutType = layoutType
    }
}


import Foundation
import Quintype


class LayoutEngine{
    
    var stories:[Story] = []
    
//    fileprivate var _queue:OperationQueue?
//    
//    fileprivate var queue:OperationQueue{
//        get{
//            
//            if _queue == nil{
//                _queue = OperationQueue.init()
//            }
//            return _queue!
//        }
//        
//        set{
//            self._queue = newValue
//        }
//    }
//    
    
    public init(stories:[Story]){
        
        self.stories = stories
    }
    
     func makeLayouts(completion:@escaping (_ layouts:[[Layout]]) -> Void){
        
//        queue.addOperation { () -> Void in
            let layouts = makeLayout(stories: self.stories)
//            OperationQueue.main.addOperation({
                completion(layouts)
//            })
//        }
    }
    
    func makeLayout(stories:[Story]) -> [[Layout]]{
        var layoutEngineArray = [[Layout]]()
        var layoutArray = [Layout]()
        for (index,_) in stories.enumerated(){
            if index == 0{
                let layout = Layout(layoutType: .headerCollection)
                layoutArray.append(layout)
            }else{
                let layout = Layout(layoutType: .defaultCollection)
                layoutArray.append(layout)
            }
        }
        layoutEngineArray.append(layoutArray)
        
        return layoutEngineArray
    }
    
}
