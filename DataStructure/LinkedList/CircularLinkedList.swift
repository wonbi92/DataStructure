//
//  CircularLinkedList.swift
//  DataStructure
//
//  Created by Wonbi on 2023/03/22.
//

import Foundation

struct CircularLinkedList<T: Equatable>: LinkedListProtocol {
    private var tail: Node<T>?
    private(set) var count: UInt = 0
    
    var isEmpty: Bool {
        tail == nil
    }
    
    mutating func insert(_ data: T) {
        print("insert:", data)
        let newNode = Node(data: data)
        
        if isEmpty {
            newNode.next = newNode
            tail = newNode
        } else {
            newNode.next = tail?.next
            tail?.next = newNode
        }
        count += 1
    }
    
    mutating func append(_ data: T) {
        print("append:", data)
        let newNode = Node(data: data)
        
        if isEmpty {
            newNode.next = newNode
        } else {
            newNode.next = tail?.next
            tail?.next = newNode
        }
        count += 1
        tail = newNode
    }
    
    mutating func insert(_ data: T, at index: UInt) {
        print("insert at \(index):", data)
        if isEmpty || index == 0 {
            insert(data)
            return
        }
        if tail == tail?.next {
            append(data)
            return
        }
        
        let newNode = Node(data: data)
        var node = tail?.next
        
        for _ in 0..<(index - 1) {
            if node == tail {
                append(data)
                return
            }
            node = node?.next
        }
        
        count += 1
        newNode.next = node?.next
        node?.next = newNode
    }
    
    mutating func removeFirst() -> T? {
        print("removeFirst", terminator: ": ")
        if isEmpty { return nil }
        
        if tail == tail?.next {
            count -= 1
            
            defer { tail = nil }
            return tail?.data
        }
        count -= 1
        defer { tail?.next = tail?.next?.next }
        return tail?.next?.data
    }
    
    mutating func removeLast() -> T? {
        print("removeLast", terminator: ": ")
        if isEmpty { return nil }
        
        if tail == tail?.next {
            count -= 1
            defer { tail = nil }
            return tail?.data
        }
        let node = searchPrevNode(index: count - 1)
        
        count -= 1
        tail = node
        defer { node?.next = node?.next?.next }
        return node?.next?.data
    }
    
    mutating func remove(at index: UInt) -> T? {
        print("remove at \(index)", terminator: ": ")
        if isEmpty || index >= count { return nil }
        
        let node = searchPrevNode(index: index)
        
        count -= 1
        defer { node?.next = node?.next?.next }
        return node?.next?.data
    }
    
    private func searchPrevNode(index: UInt) -> Node<T>? {
        if isEmpty || index >= count { return nil }
        if tail == tail?.next, index == 0 { return tail?.next }
        
        var node = tail?.next
        
        for _ in 0..<(index - 1) {
            node = node?.next
        }
        
        return node
    }
    
    func printList() {
        var node = tail?.next
        
        for _ in 0..<count {
            print(node?.data ?? "", terminator: "--")
            node = node?.next
        }
        print("nil", "갯수: \(count)", separator: "\n")
    }
}
