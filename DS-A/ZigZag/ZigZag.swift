//
//  ZigZag.swift
//  DS-A
//
//  Created by Norman, ThankaVijay on 12/09/20.
//  Copyright © 2020 Norman, ThankaVijay. All rights reserved.
//

import Foundation

class ZigZag {
    static func convert(_ s: String, _ numRows: Int) -> String {
        
        let strings = Array(s)
        var subArray = [String?]()
        var finalArray = [[String?]]()

        var interimIndex = 0
        
        for (index, char) in strings.enumerated() {
            let module = index % numRows
            
            if index >= numRows {
                finalArray.append(subArray)
                subArray = []
                
                                
                for ind in 0...numRows-1 {
                    if ind == module {
                        subArray.append(char.description)
                    } else {
                        subArray.append(nil)
                    }
                }
            } else {
                subArray.append(char.description)
            }
            
            if module == 0 {
                interimIndex += 1
            }
        }
        
        return ""
    }
}

/*
 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 
 
 
 
 P  A  Y  P
       A
    L
 I  S  H  I
       R
    I
 N  G
 */

