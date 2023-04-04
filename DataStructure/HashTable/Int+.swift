//
//  Int+.swift
//  DataStructure
//
//  Created by Wonbi on 2023/04/05.
//

import Foundation

extension Int {
    private func pow(_ y: Int) -> Int {
        Int(Darwin.pow(Double(self), Double(y)))
    }
    
    static let primeNumber: Int = 53
    
    static func getPrimeNumber(maxCapacity: Int) -> Int {
        guard maxCapacity > 2.pow(6) else { return .primeNumber }
        
        let primeList: [Int] = [97, 193, 389, 769, 1543, 3079, 6151, 12289, 24593, 49157, 98317, 196613, 393241, 786433, 1572869, 3145739, 6291469, 12582917, 25165843, 50331653, 100663319, 201326611, 402653189, 805306457, 1610612741]
        var squr: Int = 6
        
        while squr != 31 {
            if (2.pow(squr)..<2.pow(squr + 1)).contains(maxCapacity) {
                return primeList[squr - 6]
            } else {
                squr += 1
            }
        }
        return 1610612741
    }
}
