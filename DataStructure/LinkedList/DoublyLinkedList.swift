//
//  DoublyLinkedList.swift
//  DataStructure
//
//  Created by Wonbi on 2023/03/21.
//

import Foundation

struct DoublyLinkedList<T>: LinkedListProtocol {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        head == nil || tail == nil
    }
    
    mutating func insert(_ data: T) {
        <#code#>
    }
    
    mutating func append(_ data: T) {
        <#code#>
    }
    
    mutating func insert(_ data: T, at index: UInt) {
        <#code#>
    }
    
    mutating func removeFirst() -> T? {
        <#code#>
    }
    
    mutating func removeLast() -> T? {
        <#code#>
    }
    
    mutating func remove(at index: UInt) -> T? {
        <#code#>
    }
    
    func printList() {
        <#code#>
    }
    
}
