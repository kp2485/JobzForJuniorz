//
//  Queue.swift
//  JobzForJuniorz
//
//  Created by Kyle Peterson on 2/12/23.
//

import Foundation

struct Queue<T> {
    private var storage = [T]()
    
    mutating func enqueue(_ element: T) {
        storage.append(element)
    }
    
    /// the way we remove items from the queue is what seperates it from a stack:
    /// a stack removes the latest entry we added, a queue removes the oldest entry we added.
    /// thus, a stack is FIFO: First In - First Out
    mutating func dequeue() -> T? {
        guard storage.count > 0 else {
            return nil
        }
        
        return storage.removeFirst()
    }
}

/// 20230105: seperated out the stuff that is required for `Collection` protocol conformance.
extension Queue: Collection {
    var startIndex: Int {
        storage.startIndex
    }
    
    var endIndex: Int {
        storage.endIndex
    }
    
    func index(after i: Int) -> Int {
        storage.index(after: i)
    }
    
    subscript(position: Int) -> T {
        _read {
            yield storage[position]
        }
    }
}
