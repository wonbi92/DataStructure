//
//  HashTable.swift
//  DataStructure
//
//  Created by Wonbi on 2023/04/04.
//

import Foundation

final class IntKeyHashTable<Value> {
    private var table: [Bucket<Int, Value>] = Array(repeating: Bucket<Int, Value>(), count: .primeNumber)
    
    func hash(_ key: Int) -> Int {
        key % .primeNumber
    }

    func put(_ key: Int, _ value: Value) {
        let index = hash(key)
        let newCount = Int.getPrimeNumber(maxCapacity: key)
        
        if key >= newCount {
            let currentCount = table.count
            table += Array(repeating: Bucket<Int, Value>(), count: newCount - currentCount)
        }
        
        table[index][key] = value
    }
    
    func get(_ key: Int) -> Value? {
        let index = hash(key)
        
        return table[index][key]
    }
    
    func remove(_ key: Int) {
        let index = hash(key)
        
        table[index].remove(key)
    }
}

final class StringKeyHashTable<Value> {
    private var table: [Bucket<String, Value>] = Array(repeating: Bucket<String, Value>(), count: .primeNumber)

    func hash(_ key: String) -> Int {
        "\(key)".unicodeScalars.reduce(0, { $0 + Int($1.value) }) % .primeNumber
    }
    
    func put(_ key: String, _ value: Value) {
        let index = hash(key)
        let newCount = Int.getPrimeNumber(maxCapacity: index)
        
        if index >= newCount {
            let currentCount = table.count
            table += Array(repeating: Bucket<String, Value>(), count: newCount - currentCount)
        }
        
        table[index][key] = value
    }
    
    func get(_ key: String) -> Value? {
        let index = hash(key)
        
        return table[index][key]
    }
    
    func remove(_ key: String) {
        let index = hash(key)
        
        table[index].remove(key)
    }
}
