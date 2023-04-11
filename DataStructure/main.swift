//
//  main.swift
//  DataStructure
//
//  Created by Wonbi on 2023/03/21.
//

import Foundation

let binarySearchTree = BinarySearchTree<Int>()

binarySearchTree.insert(16)
binarySearchTree.insert(23)
binarySearchTree.insert(21)
binarySearchTree.insert(19)
binarySearchTree.insert(12)
binarySearchTree.insert(10)
binarySearchTree.insert(11)
binarySearchTree.insert(20)
binarySearchTree.insert(17)
binarySearchTree.insert(18)
binarySearchTree.insert(13)
binarySearchTree.insert(9)
binarySearchTree.insert(15)
binarySearchTree.insert(14)

print(binarySearchTree.asString)
print()
binarySearchTree.remove(16)

print(binarySearchTree.asString)
print()
binarySearchTree.remove(18)

print(binarySearchTree.asString)
print()
binarySearchTree.remove(19)

print(binarySearchTree.asString)
print()
binarySearchTree.remove(13)

print(binarySearchTree.asString)
print()
binarySearchTree.remove(23)

print(binarySearchTree.asString)
print()
