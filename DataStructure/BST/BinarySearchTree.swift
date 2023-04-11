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
    
    private func search(_ data: T) -> Node<T>? {
        if isEmpty { return nil }
        
        var currentNode = root
        
        while let node = currentNode {
            if node.data == data { return node }

            if data < node.data {
                currentNode = node.left
            } else {
                currentNode = node.right
            }
        }
        
        return nil
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
                currentNode = node.left
            } else {
                currentNode = node.right
            }
        }
        
        if data < currentNode!.data {
            currentNode?.left = Node(data: data)
        } else {
            currentNode?.right = Node(data: data)
        }
    }
    
    
}
