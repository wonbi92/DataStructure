//
//  LinkedListProtocol.swift
//  DataStructure
//
//  Created by Wonbi on 2023/03/21.
//

import Foundation

protocol LinkedListProtocol {
    associatedtype T
    
    var isEmpty: Bool { get }
    
    mutating func insert(_ data: T)
    mutating func append(_ data: T)
    mutating func insert(_ data: T, at index: UInt)
    mutating func removeFirst() -> T?
    mutating func removeLast() -> T?
    mutating func remove(at index: UInt) -> T?
    func printList()
}
