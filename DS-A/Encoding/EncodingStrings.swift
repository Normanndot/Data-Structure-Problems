//
//  EncodingStrings.swift
//  DS-A
//
//  Created by Norman, ThankaVijay on 02/10/20.
//  Copyright © 2020 Norman, ThankaVijay. All rights reserved.
//

import Foundation

class EncodingStrings {
    static func frequency(s: String) -> [Int] {
        var result = Array(repeating: 0, count: 26)
        var lastIndex = s.count-1
        let inputArray = Array(s)
        
        while lastIndex >= 0 {
            let stringValue = String(inputArray[lastIndex])
            
            if stringValue == "#" {
                let encodedString = String(inputArray[lastIndex-2...lastIndex])
                let intValue = Int(String(encodedString.prefix(2))) ?? 0
                result[intValue-1] = 1
                lastIndex -= 3
                continue
            }
            
            if stringValue == ")" {
                if lastIndex >= 3 {
                    let stringInitialVal = String(inputArray[lastIndex-3])
                    if stringInitialVal == "#" {
                        let encodedString = String(inputArray[lastIndex-5...lastIndex])
                        let intValue = Int(String(encodedString.prefix(2))) ?? 0
                        let finalValue = Int(String(encodedString.dropLast().last ?? "0"))! + Int(result[intValue-1])
                        result[intValue-1] = finalValue
                        lastIndex -= 6
                        continue
                    } else {
                        let encodedString = String(inputArray[lastIndex-3...lastIndex])
                        let intValue = Int(String(encodedString.prefix(1))) ?? 0
                        let finalValue = Int(String(encodedString.dropLast().last!)) ?? 0 + (Int(result[intValue-1]))
                        result[intValue-1] = finalValue
                        lastIndex -= 4
                        continue
                    }
                }
            }
            
            let intValue = Int(stringValue) ?? 0
            result[intValue-1] = 1
            lastIndex -= 1
        }
        
        
        
        return result
    }
}
