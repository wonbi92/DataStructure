//
//  Node.swift
//  DataStructure
//
//  Created by Wonbi on 2023/04/11.
//

import Foundation

final class Node<T: Comparable> {
    var data: T
    weak var parent: Node<T>?
    var left: Node<T>?
    var right: Node<T>?
    
    var isRoot: Bool {
        return parent == nil
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    var isFull: Bool {
        return left != nil && right != nil
    }
    
    var hasOnlyLeft: Bool {
        return left != nil && right == nil
    }
    
    init(data: T) {
        self.data = data
    }
}
