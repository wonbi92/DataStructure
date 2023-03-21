//
//  DoublyLinkedList.swift
//  DataStructure
//
//  Created by Wonbi on 2023/03/21.
//

import Foundation

struct DoublyLinkedList<T: Equatable>: LinkedListProtocol {
    private var head: Node<T>?
    private var tail: Node<T>?
    private var count: UInt = 0
    
    var isEmpty: Bool {
        head == nil || tail == nil
    }
    
    mutating func insert(_ data: T) {
        print("insert:", data)
        defer { count += 1 }
        let newNode = Node(data: data)
        
        if isEmpty {
            head = newNode
            tail = newNode
            return
        }
        
        head?.prev = newNode
        newNode.next = head
        head = newNode
    }
    
    mutating func append(_ data: T) {
        print("append:", data)
        defer { count += 1 }
        let newNode = Node(data: data)
        
        if isEmpty {
            head = newNode
            tail = newNode
            return
        }
    
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    mutating func insert(_ data: T, at index: UInt) {
        print("insert at \(index):", data)
        defer { count += 1 }
        let newNode = Node(data: data)
        var node: Node<T>?
        
        if isEmpty {
            head = newNode
            tail = newNode
            return
        }
        
        node = searchNode(index: index)
        
        newNode.next = node
        newNode.prev = node?.prev
        node?.prev?.next = newNode
        node?.prev = newNode
    }
    
    @discardableResult
    mutating func removeFirst() -> T? {
        print("removeFirst", terminator: ": ")
        if isEmpty { return nil }
        defer { count -= 1 }
        
        if head == tail {
            defer {
                head = nil
                tail = nil
            }
            return head?.data
        }
        
        let result = head?.data
        
        head = head?.next
        head?.prev = nil
        
        return result
    }
    
    @discardableResult
    mutating func removeLast() -> T? {
        print("removeLast", terminator: ": ")
        if isEmpty { return nil }
        defer { count -= 1 }

        if head == tail {
            defer {
                head = nil
                tail = nil
            }
            return head?.data
        }
        
        let result = tail?.data
        
        tail = tail?.prev
        tail?.next = nil
        
        return result
    }
    
    @discardableResult
    mutating func remove(at index: UInt) -> T? {
        print("remove at \(index)", terminator: ": ")
        defer { count -= 1 }
        if isEmpty { return nil }
        if index == 0 { return removeFirst() }
        
        let node = searchNode(index: index)
        
        node?.prev?.next = node?.next
        node?.next?.prev = node?.prev
        
        return node?.data
    }
    
    private func searchNode(index: UInt) -> Node<T>? {
        if isEmpty, count > index { return nil }
        
        var node = head
        
        if (count / 2) > index {
            for _ in 0..<index {
                node = node?.next
            }
        } else {
            node = tail
            for _ in 1..<(count - index) {
                node = node?.prev
            }
        }
        
        return node
    }
    
    func printList() {
        var node = head
        
        while node != nil {
            print(node?.data ?? "", terminator: "--")
            node = node?.next
        }
        print("nil", "갯수: \(count)", separator: "\n")
    }
}
