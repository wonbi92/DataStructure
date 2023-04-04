//
//  Element.swift
//  DataStructure
//
//  Created by Wonbi on 2023/04/04.
//

import Foundation

struct Element<Key: Hashable, Value> {
    let key: Key
    var value: Value
    
    init(_ key: Key, _ value: Value) {
        self.key = key
        self.value = value
    }
}
