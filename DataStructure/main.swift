//
//  main.swift
//  DataStructure
//
//  Created by Wonbi on 2023/03/21.
//

import Foundation

var linkedList = SinglyLinkedList<Int>()

linkedList.append(1)
linkedList.printList()
print(linkedList.removeLast(), "removeLast")
linkedList.printList()

linkedList.insert(2)
linkedList.printList()
linkedList.insert(1)
linkedList.printList()
linkedList.append(3)
linkedList.printList()
print(linkedList.removeLast(), "removeLast")
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

print(linkedList.remove(at: 4), "remove at 4")
linkedList.printList()
print(linkedList.removeFirst(), "removeFirst")
linkedList.printList()
print(linkedList.removeLast(), "removeLast")
linkedList.printList()


linkedList.insert(7, at: 2)
linkedList.printList()

print(linkedList.remove(at: 5), "remove at 11")
linkedList.printList()


