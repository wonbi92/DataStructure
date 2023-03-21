//
//  SinglyLinkedList.swift
//  DataStructure
//
//  Created by Wonbi on 2023/03/21.
//

import Foundation

struct SinglyLinkedList<T> {
    private var head: Node<T>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    mutating func insert(_ data: T) {
        print("insert:", data)
        let newData = Node(data: data, next: head)
        head = newData
    }
    
    mutating func append(_ data: T) {
        print("append:", data)
        let newData = Node(data: data)
        
        if isEmpty {
            head = newData
            return
        }
        
        var node = head
        
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = newData
    }
    
    mutating func insert(_ data: T, at index: UInt) {
        print("insert at \(index):", data)
        let newData = Node(data: data)
        var node = head
        
        if isEmpty {
            insert(data)
            return
        }
        
        if index == 0 {
            newData.next = head
            head = newData
            return
        }
        
        for _ in 0..<(index - 1) {
            if node?.next == nil { break }
            node = node?.next
        }
        
        newData.next = node?.next
        node?.next = newData
    }
    
    @discardableResult
    mutating func removeFirst() -> T? {
        var node = head
        head = head?.next
        
        let result = node?.data
        node = nil
        
        return result
    }
    
    @discardableResult
    mutating func removeLast() -> T? {
        var current = head
        
        if head?.next == nil {
            head = nil
            return current?.data
        }
        
        while current?.next?.next != nil {
            current = current?.next
        }
        
        let result = current?.next?.data
        current?.next = nil
        
        return result
    }
    
    @discardableResult
    mutating func remove(at index: UInt) -> T? {
        var node = head
        
        if isEmpty || index == 0 {
            head = head?.next
            return node?.data
        }
        
        for _ in 0..<(index - 1) {
            node = node?.next
        }
        
        let result = node?.next?.data
        node?.next = node?.next?.next
        
        return result
    }
    
    func printList() {
        var current = head
        
        while current != nil {
            print(current?.data ?? "", terminator: "->")
            current = current?.next
        }
        print("nil")
    }
}
