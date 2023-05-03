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
        guard let root else { return "Tree is Empty" }
        
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
        guard let node = search(data) else { return }
        print("remove \(data)")
        
        if node.isRoot {
            removeRoot(node: node)
        } else if node.isLeaf {
            removeLeaf(node: node)
        } else if !node.isFull {
            removeInternal(node: node)
        } else {
            removeFull(node: node)
        }
    }
    
    private func removeRoot(node: Node<T>) {
        // root가 LeafNode일 경우
        if node.isLeaf {
            root = nil
        // root가 왼쪽 노드만 가지고 있을 경우
        } else if node.hasOnlyLeft {
            var lastRightNode = node.left
            
            // 루트 왼쪽노드의 가장 오른쪽에 있는 노드를 찾는 로직
            while let nextNode = lastRightNode?.right {
                lastRightNode = nextNode
            }
            
            // 가장 오른쪽에 있는 노드가 왼쪽에 데이터를 가지고 있을 경우
            if let leftNode = lastRightNode?.left {
                lastRightNode?.left?.parent = lastRightNode?.parent
                lastRightNode?.parent?.right = leftNode
            // 가장 오른쪽에 있는 노드가 LeafNode일 경우
            } else {
                lastRightNode?.parent?.right = nil
            }
            
            // 노드 교체 로직
            root?.left?.parent = lastRightNode
            lastRightNode?.left = root?.left
            root = lastRightNode
            
            lastRightNode?.parent = nil
        // root가 FullNode이거나 오른쪽 노드만 가지고 있는 경우
        } else {
            var lastLeftNode = node.right
            
            // 루트 오른쪽노드의 가장 왼쪽에 있는 노드를 찾는 로직
            while let nextNode = lastLeftNode?.left {
                lastLeftNode = nextNode
            }
            
            // 가장 왼쪽에 있는 노드가 오른쪽에 데이터를 가지고 있을 경우
            if let rightNode = lastLeftNode?.right {
                lastLeftNode?.right?.parent = lastLeftNode?.parent
                lastLeftNode?.parent?.left = rightNode
            // 가장 왼쪽에 있는 노드가 LeafNode일 경우
            } else {
                lastLeftNode?.parent?.left = nil
            }
            
            // 노드 교체 로직
            if node.left != nil {
                root?.left?.parent = lastLeftNode
                lastLeftNode?.left = root?.left
            }
            root?.right?.parent = lastLeftNode
            lastLeftNode?.right = root?.right
            root = lastLeftNode
            
            lastLeftNode?.parent = nil
        }
    }
    
    private func removeLeaf(node: Node<T>) {
        if node.data == node.parent?.left?.data {
            node.parent?.left = nil
        } else {
            node.parent?.right = nil
        }
    }
    
    private func removeInternal(node: Node<T>) {
        guard let parentNode = node.parent else { return }
        
        if node.hasOnlyLeft {
            node.left?.parent = node.parent
            if node.data < parentNode.data {
                parentNode.left = node.left
            } else {
                parentNode.right = node.left
            }
        } else {
            node.right?.parent = node.parent
            if node.data < parentNode.data {
                parentNode.left = node.right
            } else {
                parentNode.right = node.right
            }
        }
    }
    
    private func removeFull(node: Node<T>) {
        var lastLeftNode = node.right
        
        // node 오른쪽노드의 가장 왼쪽에 있는 노드를 찾는 로직
        while let nextNode = lastLeftNode?.left {
            lastLeftNode = nextNode
        }
        
        // 가장 왼쪽에 있는 노드가 오른쪽에 데이터를 가지고 있을 경우
        if let rightNode = lastLeftNode?.right {
            lastLeftNode?.right?.parent = lastLeftNode?.parent
            lastLeftNode?.parent?.left = rightNode
        // 가장 왼쪽에 있는 노드가 LeafNode일 경우
        } else {
            lastLeftNode?.parent?.left = nil
        }
        
        // 노드 교체 로직
        node.right?.parent = lastLeftNode
        node.left?.parent = lastLeftNode
        lastLeftNode?.right = node.right
        lastLeftNode?.left = node.left
        
        node.parent?.left = lastLeftNode
        lastLeftNode?.parent = node.parent
    }
}
