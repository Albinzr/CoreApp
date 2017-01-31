//
//  Queue.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/27/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation

public enum Queue {
    case main
    case background
    case userInteractive
    case userInitiated
    case utility
    case `default`
    case custom(queue: DispatchQueue)
    
    public var queue : DispatchQueue {
        switch self {
        case .main:
            return DispatchQueue.main
        case .background:
            return DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        case .userInteractive:
            return DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive)
        case .userInitiated:
            return DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated)
        case .utility:
            return DispatchQueue.global(qos: DispatchQoS.QoSClass.utility)
        case .default:
            return DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
        case .custom(let queue):
            return queue
        }
    }
}

import Foundation

public typealias Closure = ((Any?) -> Any?)
public typealias StartClosure = ((Void) -> Any?)
public typealias CompletionClosure = ((Any?) -> Void)

// MARK: - Task Class
public final class Task {
    
    fileprivate let closure: Closure
    fileprivate let queue: Queue
    fileprivate let previousTask: Task?
    
    fileprivate init(_ queue: Queue, _ previousTask: Task? = nil, _ closure: @escaping Closure) {
        self.closure = closure
        self.queue = queue
        self.previousTask = previousTask
    }
    
    fileprivate func runTask(_ next: @escaping Closure) -> Closure? {
        let _closure = self.closure
        let _queue = self.queue.queue
        
        if let _previousTask = self.previousTask {
            return _previousTask.runTask { result in
                _queue.async { _ = next(_closure(result)) }
                return nil
            }
        } else {
            _queue.async { _ = next(_closure(nil)) }
            return nil
        }
    }
}

// MARK: - Run Task
extension Task {
    
    public final func run(_ queue: Queue? = nil, _ completion: CompletionClosure? = nil) {
        let _queue = queue?.queue ?? self.queue.queue
        _ = self.runTask { result in
            _queue.async { completion?(result) }
            return nil
        }
    }
}

// MARK: - Static Functions
extension Task {
    
    public static func main(_ closure: @escaping StartClosure) -> Task {
        return Task(Queue.main, nil, { _ in return closure() })
    }
    
    public static func background(_ closure: @escaping StartClosure) -> Task {
        return Task(Queue.background, nil, { _ in return closure() })
    }
    
    public static func userInteractive(_ closure: @escaping StartClosure) -> Task {
        return Task(Queue.userInteractive, nil, { _ in return closure() })
    }
    
    public static func userInitiated(_ closure: @escaping StartClosure) -> Task {
        return Task(Queue.userInitiated, nil, { _ in return closure() })
    }
    
    public static func utility(_ closure: @escaping StartClosure) -> Task {
        return Task(Queue.utility, nil, { _ in return closure() })
    }
    
    public static func onDefault(_ closure: @escaping StartClosure) -> Task {
        return Task(Queue.default, nil, { _ in return closure() })
    }
    
    public static func custom(_ queue: DispatchQueue, _ closure: @escaping StartClosure) -> Task {
        return Task(Queue.custom(queue: queue), nil, { _ in return closure() })
    }
    
    public static func after(_ queue: Queue = Queue.background, seconds: Double, _ closure: @escaping StartClosure) -> Task {
        return Task(queue, nil) { _ in
            Task.waitBlock(seconds)()
            return closure()
        }
    }
    
    public static func wait(_ queue: Queue = Queue.background, seconds: Double, _ closure: StartClosure) -> Task {
        return Task(queue, nil) { _ in
            Task.waitBlock(seconds)()
            return nil
        }
    }
    
    fileprivate static func waitBlock(_ seconds: Double) -> ((Void) -> Void) {
        return {
            let nanoSeconds = Int64(seconds * Double(NSEC_PER_SEC))
            let time = DispatchTime.now() + Double(nanoSeconds) / Double(NSEC_PER_SEC)
            
            let sem = DispatchSemaphore(value: 0)
            _ = sem.wait(timeout: time)
        }
    }
}

// MARK: - Instance Functions
extension Task {
    
    public final func main(_ closure: @escaping Closure) -> Task {
        return Task(Queue.main, self, closure)
    }
    
    public final func background(_ closure: @escaping Closure) -> Task {
        return Task(Queue.background, self, closure)
    }
    
    public final func userInteractive(_ closure: @escaping Closure) -> Task {
        return Task(Queue.userInteractive, self, closure)
    }
    
    public final func userInitiated(_ closure: @escaping Closure) -> Task {
        return Task(Queue.userInitiated, self, closure)
    }
    
    public final func utility(_ closure: @escaping Closure) -> Task {
        return Task(Queue.utility, self, closure)
    }
    
    public final func onDefault(_ closure: @escaping Closure) -> Task {
        return Task(Queue.default, self, closure)
    }
    
    public final func custom(_ queue: DispatchQueue, _ closure: @escaping Closure) -> Task {
        return Task(Queue.custom(queue: queue), self, closure)
    }
    
    public final func after(_ queue: Queue = Queue.background, seconds: Double, _ closure: @escaping Closure) -> Task {
        return Task(queue, self) { result in
            Task.waitBlock(seconds)()
            return closure(result)
        }
    }
    
    public final func wait(_ queue: Queue = Queue.background, seconds: Double) -> Task {
        return Task(queue, self) { result in
            Task.waitBlock(seconds)()
            return result
        }
    }
}
