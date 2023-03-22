//
//  main.swift
//  DataStructure
//
//  Created by Wonbi on 2023/03/21.
//

import Foundation

var linkedList = CircularLinkedList<Int>()

linkedList.append(1)
linkedList.printList()
print(linkedList.removeLast() ?? "nil")
linkedList.printList()
print(linkedList.removeFirst() ?? "nil")
linkedList.printList()
print(linkedList.removeLast() ?? "nil")
linkedList.printList()

linkedList.insert(2)
linkedList.printList()
linkedList.insert(1)
linkedList.printList()
linkedList.append(3)
linkedList.printList()
print(linkedList.removeLast() ?? "nil")
linkedList.printList()

linkedList.append(3)
linkedList.printList()
linkedList.append(4)
linkedList.printList()
linkedList.append(5)
linkedList.printList()

linkedList.insert(0)
linkedList.printList()
linkedList.append(6)
linkedList.printList()

linkedList.insert(7, at: 4)
linkedList.printList()

print(linkedList.remove(at: 4) ?? "nil")
linkedList.printList()
print(linkedList.removeFirst() ?? "nil")
linkedList.printList()
print(linkedList.removeLast() ?? "nil")
linkedList.printList()


