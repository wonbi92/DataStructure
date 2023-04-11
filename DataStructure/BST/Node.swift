//
//  Node.swift
//  DataStructure
//
//  Created by Wonbi on 2023/04/11.
//

import Foundation

final class Node<T: Comparable> {
    var data: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(data: T, left: Node<T>? = nil, right: Node<T>? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }
}
