//
//  ViewController.swift
//  DS-A
//
//  Created by Norman, ThankaVijay on 12/09/20.
//  Copyright © 2020 Norman, ThankaVijay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(ZigZag.convert("PAYPALISHIRING", 4))
//        print(SubString11.output(values: [3, 9])
//        print(EncodingStrings.frequency(s:  "23#(2)24#25#26#23#(3)"))
        print(Sort.MergeSort.mergeSort(list: [0,1,1,2,2,2,2,2,1,1,1,1,0,0,0,0]))
    }
}

