//
//  Node.swift
//  DataStructure
//
//  Created by Wonbi on 2023/03/21.
//

import Foundation

final class Node<T> {
    var prev: Node?
    var data: T
    var next: Node?
    
    init(prev: Node? = nil, data: T, next: Node? = nil) {
        self.prev = prev
        self.data = data
        self.next = next
    }
}
