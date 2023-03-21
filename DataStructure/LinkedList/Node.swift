//
//  Node.swift
//  DataStructure
//
//  Created by Wonbi on 2023/03/21.
//

import Foundation

final class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
