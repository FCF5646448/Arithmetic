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
        //end表示已经确定的倒数第i个最大值。
        while end > 0 {
            /*
             第1次循环确定了最大的数；
             第2次循环确定了倒数第二大的数；
             ...
             第i次循环可以找到倒数第i个最大值；
             所以每次循环只需要比较到end的位置
             //每一轮将当前最大值放到范围之内的最后
             */
            //，所以每次循环只需要循环到
            for begin in 1..<(end + 1) {
                if arr[begin] < arr[begin - 1] {
                    let temp = arr[begin]
                    arr[begin] = arr[begin - 1]
                    arr[begin - 1] = temp
                }
            }
            end -= 1
        }
    }
}
