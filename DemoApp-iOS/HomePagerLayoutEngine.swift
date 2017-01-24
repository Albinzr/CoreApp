//
//  PagerLayout.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/20/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//





import Foundation
import Quintype


class HomePagerLayoutEngine{
    
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
    
     func makeLayouts(completion:@escaping (_ layouts:[[HomeLayout]]) -> Void){
        
//        queue.addOperation { () -> Void in
            let layouts = makeLayout(stories: self.stories)
//            OperationQueue.main.addOperation({
                completion(layouts)
//            })
//        }
    }
    
    func makeLayout(stories:[Story]) -> [[HomeLayout]]{
        var layoutEngineArray = [[HomeLayout]]()
        var layoutArray = [HomeLayout]()
        for (index,_) in stories.enumerated(){
            if index == 0{
                let layout = HomeLayout(layoutType: .headerCollection)
                layoutArray.append(layout)
            }else{
                let layout = HomeLayout(layoutType: .defaultCollection)
                layoutArray.append(layout)
            }
        }
        layoutEngineArray.append(layoutArray)
        
        return layoutEngineArray
    }
    
}
