//
//  Bucket.swift
//  DataStructure
//
//  Created by Wonbi on 2023/04/04.
//

import Foundation

struct Bucket<Key: Hashable, Value> {
    private var elements: [Element<Key, Value>] = []
    
    subscript(key: Key) -> Value? {
        get {
            elements.first(where: { $0.key == key } )?.value
        }
        
        set(newValue) {
            if let newValue {
                insert(newValue, forKey: key)
            } else {
                remove(key)
            }
        }
    }
    
    mutating func remove(_ key: Key) {
        guard let indexOfMatchingKey = elements.firstIndex(where: { $0.key == key }) else { return }
        
        elements.remove(at: indexOfMatchingKey)
    }
    
    private mutating func insert(_ value: Value, forKey key: Key) {
        var foundMatch: Bool = false
        
        for i in 0..<elements.count where elements[i].key == key {
            elements[i].value = value
            foundMatch = true
            break
        }
        if !foundMatch {
            elements.append(Element(key, value))
        }
    }
}

