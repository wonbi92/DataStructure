//
//  BinarySearchTree.swift
//  DataStructure
//
//  Created by Wonbi on 2023/04/11.
//

import Foundation

final class BinarySearchTree<T: Comparable> {
    private var root: Node<T>?
    
    var isEmpty: Bool {
        return root == nil
    }
    
    var asString: String {
        guard let root else { return "" }
        
        return treeString(root) { ("\($0.data)", $0.left, $0.right) }
    }
    
    func search(_ data: T) -> Node<T>? {
        if isEmpty { return nil }
        
        var currentNode = root
        
        while let node = currentNode {
            if node.data == data { break }

            if data < node.data {
                currentNode = node.left
            } else {
                currentNode = node.right
            }
        }
        
        return currentNode
    }

    func insert(_ data: T) {
        if isEmpty {
            root = Node(data: data)
            return
        }
        
        var currentNode = root
        
        while let node = currentNode {
            if node.data == data { return }
            
            if data < node.data {
                guard let nextNode = node.left else {
                    currentNode?.left = Node(data: data)
                    currentNode?.left?.parent = currentNode
                    return
                }
                currentNode = nextNode
            } else {
                guard let nextNode = node.right else {
                    currentNode?.right = Node(data: data)
                    currentNode?.right?.parent = currentNode
                    return
                }
                currentNode = nextNode
            }
        }
    }
    
    func remove(_ data: T) {
        
    }
}
