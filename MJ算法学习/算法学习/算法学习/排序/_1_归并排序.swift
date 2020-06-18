//
//  _1_归并排序.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/17.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Sort {
    func mergerSort() {
        
    }
    
    
    func sort(_ arr:inout [Int], _ begin:Int, _ end:Int) {
        var mid = (begin + end)/2
        
        sort(&arr, begin, mid)
        sort(&arr, mid, end)
        merge(&arr, begin, mid, end)
        
    }
    
    
    func merge(_ arr:inout [Int], _ begin:Int, _ mid:Int, _ end:Int) {
        
    }
    
}
