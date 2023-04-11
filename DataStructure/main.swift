//
//  main.swift
//  DataStructure
//
//  Created by Wonbi on 2023/03/21.
//

import Foundation

let binarySearchTree = BinarySearchTree<Int>()

binarySearchTree.insert(15)
binarySearchTree.insert(10)
binarySearchTree.insert(9)
binarySearchTree.insert(20)
binarySearchTree.insert(13)
binarySearchTree.insert(18)
binarySearchTree.insert(16)

print(binarySearchTree.asString)

let isExist20 = (binarySearchTree.search(20))
let isExist30 = (binarySearchTree.search(30))

print("isExist20: \(isExist20?.data) / isExist30: \(isExist30?.data)")
