//
//  _0_冒泡排序.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/17.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Sort {
    //冒泡排序
    //邻居比较，一轮排序就相当于确定了最后一个元素。
    func bubbleSort(_ arr: inout [Int]) {
        var end = arr.count - 1
        while end > 0 {
            //一轮排序
            for begin in 1..<(end+1) {
                if arr[begin] < arr[begin - 1] {
                    let temp = arr[begin]
                    arr[begin] = arr[begin - 1]
                    arr[begin - 1] = temp
                }
            }
            
            end -= 1
        }
        
        print(arr)
    }
}
