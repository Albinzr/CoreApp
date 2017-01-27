//
//  Queue.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 1/27/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import Foundation

public enum GCD {
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


public typealias QueueNextClosure = ((AnyObject?) -> QueueResult)
public typealias QueueErrorClosure = ((Error) -> Void)
public typealias QueueCompletionClosure = ((AnyObject?) -> Void)
public typealias QueueCancelClosure = ((Void) -> Void)

public enum QueueType {
    
    case next(closure: QueueNextClosure)
    case error(closure: QueueErrorClosure)
    case completion(closure: QueueCompletionClosure)
    case cancel(closure: QueueCancelClosure)
    
    var isNextType: Bool {
        if case .next(_) = self { return true }
        return false
    }
}

public enum QueueResult {
    
    case next(result: AnyObject?)
    case retry(result: AnyObject?)
    case back(result: AnyObject?)
    case restart(result: AnyObject?)
    case error(Error: Error)
    case finish(result: AnyObject?)
    case cancel
}

public final class Queue {
    
    fileprivate var elements: [QueuePoint] = []
    
    fileprivate func nextPoints() -> [QueuePoint] {
        return self.elements.filter() { $0.type.isNextType }
    }
    
    fileprivate func queuePointsAtIndex(_ index: Int) -> QueuePoint? {
        return self.nextPoints()
            .enumerated()
            .filter() { $0.offset == index }
            .map() { return $0.element }
            .first
    }
    
    fileprivate func previousQueuePoint(_ currentQueuePoint: QueuePoint) -> QueuePoint? {
        let index = self.nextPoints()
            .enumerated()
            .filter() { $0.element === currentQueuePoint }
            .map() { return $0.offset - 1 }
            .first
        
        return index != nil ? self.queuePointsAtIndex(index!) : nil
    }
    
    fileprivate func nextQueuePoint(_ currentQueuePoint: QueuePoint) -> QueuePoint? {
        let index = self.nextPoints()
            .enumerated()
            .filter() { $0.element === currentQueuePoint }
            .map() { return $0.offset + 1 }
            .first
        
        return index != nil ? self.queuePointsAtIndex(index!) : nil
    }
    
    fileprivate func runCompletion(_ obj: AnyObject?) {
        self.elements.forEach() { if case .completion(let f) = $0.type { $0.gcd.queue.async { f(obj) } }}
    }
    
    fileprivate func queue(_ previousResult: QueueResult, _ previousQueuePoint: QueuePoint?) {
        let queuePoint = previousQueuePoint ?? self.queuePointsAtIndex(0)
        guard let _queuePoint = queuePoint else {
            self.runCompletion(nil)
            return
        }
        
        switch previousResult {
        case .next(let result):
            guard let _nextQueuePoint = self.nextQueuePoint(_queuePoint) else {
                self.runCompletion(result)
                return
            }
            if case .next(let f) = _nextQueuePoint.type { _nextQueuePoint.gcd.queue.async { self.queue(f(result), _nextQueuePoint) }}
        case .retry(let result):
            if case .next(let f) = _queuePoint.type { _queuePoint.gcd.queue.async { self.queue(f(result), _queuePoint) }}
        case .back(let result):
            guard let _nextQueuePoint = self.previousQueuePoint(_queuePoint) else {
                self.runCompletion(result)
                return
            }
            if case .next(let f) = _nextQueuePoint.type { _nextQueuePoint.gcd.queue.async { self.queue(f(result), _nextQueuePoint) } }
        case .restart(let result):
            self.queue(.retry(result: result), nil)
        case .error(let error):
            self.elements.forEach() { if case .error(let f) = $0.type { $0.gcd.queue.async { f(error) } }}
            self.runCompletion(nil)
        case .finish(let result):
            self.runCompletion(result)
        case .cancel:
            self.elements.forEach() { if case .cancel(let f) = $0.type { $0.gcd.queue.async { f() } }}
            self.runCompletion(nil)
        }
    }
}

// MARK: - QueuePoint

private final class QueuePoint {
    
    fileprivate let gcd: GCD
    fileprivate let type: QueueType
    
    fileprivate init(_ gcd: GCD, _ type: QueueType) {
        self.gcd = gcd
        self.type = type
    }
}

// MARK: - Queue away

extension Queue {
    
    public final func queue(_ obj: AnyObject? = nil) {
        self.queue(.retry(result: obj), nil)
    }
}

// MARK: - Queue Static Functions

extension Queue {
    
    public static func onFirst(_ gcd: GCD = GCD.main, closure: @escaping QueueNextClosure) -> Queue {
        let queue = Queue()
        queue.elements.append(QueuePoint(gcd, .next(closure: closure)))
        return queue
    }
}

// MARK: - Queue Instance Functions

extension Queue {
    
    public final func onNext(_ gcd: GCD = GCD.main, _ closure: @escaping QueueNextClosure) -> Queue {
        self.elements.append(QueuePoint(gcd, .next(closure: closure)))
        return self
    }
    
    public final func onError(_ gcd: GCD = GCD.main, _ closure: @escaping QueueErrorClosure) -> Queue {
        self.elements.append(QueuePoint(gcd, .error(closure: closure)))
        return self
    }
    
    public final func onComplete (_ gcd: GCD = GCD.main, _ closure: @escaping QueueCompletionClosure) -> Queue {
        self.elements.append(QueuePoint(gcd, .completion(closure: closure)))
        return self
    }
    
    public final func onCancel(_ gcd: GCD = GCD.main, _ closure: @escaping QueueCancelClosure) -> Queue {
        self.elements.append(QueuePoint(gcd, .cancel(closure: closure)))
        return self
    }
}
