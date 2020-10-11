//
//  Sort.swift
//  DS-A
//
//  Created by Norman, ThankaVijay on 08/10/20.
//  Copyright © 2020 Norman, ThankaVijay. All rights reserved.
//

import Foundation

class Sort {
    class MergeSort {
        static func merge(left:[Int],right:[Int]) -> [Int] {
            var mergedList = [Int]()
            var left = left
            var right = right
            
            while left.count > 0 && right.count > 0 {
                if left.first! < right.first! {
                    mergedList.append(left.removeFirst())
                } else {
                    mergedList.append(right.removeFirst())
                }
            }
         
            return mergedList + left + right
        }
         
        static func mergeSort(list:[Int]) -> [Int] {
            guard list.count > 1 else {
                return list
            }
            
            let leftList = Array(list[0..<list.count/2])
            let rightList = Array(list[list.count/2..<list.count])
            
            return MergeSort.merge(left: mergeSort(list:leftList), right: mergeSort(list:rightList))
        }
    }
}
