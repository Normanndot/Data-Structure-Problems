//
//  SubString11.swift
//  DS-A
//
//  Created by Norman, ThankaVijay on 15/09/20.
//  Copyright © 2020 Norman, ThankaVijay. All rights reserved.
//

import Foundation

class SubString11 {
    static func output(values:[Int]) -> String {
        
        let array = values.map {
            var binaryValues = [String]()
            
            var value = 1
            var interimValue = $0
            
            while 1 <= value {
                if SubString11.hasElevenAsSubsString(value: String(value,radix: 2)) {
                    interimValue += 1
                } else {
                    binaryValues.append(String(value,radix: 2))
                }

                if value == interimValue {
                    value = -2
                }

                value += 1
            }
        }
        
        return ""
    }


    static func hasElevenAsSubsString(value:String) -> Bool {
        if value.contains("11"){
            return true
        }
        return false
    }
}
