//
//  DFS.swift
//  DataStructure
//
//  Created by Wonbi on 2023/05/03.
//

import Foundation

struct DFS {
    static func traversePreOrder<T: Comparable>(node: Node<T>?) {
        guard let node = node else {
            return
        }
        print(node.data)
        traversePreOrder(node: node.left)
        traversePreOrder(node: node.right)
    }
    
    static func traverseInOrder<T: Comparable>(node: Node<T>?) {
        guard let node = node else {
            return
        }
        traversePreOrder(node: node.left)
        print(node.data)
        traversePreOrder(node: node.right)
    }
    
    static func traversePostOrder<T: Comparable>(node: Node<T>?) {
        guard let node = node else {
            return
        }
        traversePreOrder(node: node.left)
        traversePreOrder(node: node.right)
        print(node.data)
    }
}
