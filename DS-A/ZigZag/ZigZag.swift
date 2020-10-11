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
        
        let stringArray = Array(s)
        var array = [String?]()
        
        for (index,char) in stringArray.enumerated() {
            let aChar = String(char)
            
            
            
            if index == numRows {
                
            }
            array.append(aChar)
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

