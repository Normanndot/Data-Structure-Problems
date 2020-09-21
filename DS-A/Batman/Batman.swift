//
//  Batman.swift
//  DS-A
//
//  Created by Norman, ThankaVijay on 13/09/20.
//  Copyright © 2020 Norman, ThankaVijay. All rights reserved.
//

import Foundation

class Batman {
    static func isBatmanAvailable(posters: [Int]) -> String {
      guard posters.count % 2 != 0 else { return "NO" }
      if let maxValue = posters.max() {
        let dups = Dictionary(grouping: posters, by: {$0}).filter { $1.count > 1 }.keys
        if dups.contains(maxValue) {
          return "NO"
        } else {
          return "YES"
        }
      }
      return "NO"
    }
}
