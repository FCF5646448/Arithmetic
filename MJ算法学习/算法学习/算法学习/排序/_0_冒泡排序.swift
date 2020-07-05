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
    //优化思路，对应后面已经排好序的部分不再进行排序，比如：3、2、6、5、1、7、8、9。那7、8、9就不再进行排序。
    func bubleSort2(_ arr:inout [Int]) {
        var end = arr.count //记录已经确定最大值的下标
        while end > 0 {
            var sortIndex = 1
            //每一轮确定一个最大值
            for begin in 1..<end {
                if arr[begin] < arr[begin - 1] {
                    let temp = arr[begin]
                    arr[begin] = arr[begin - 1]
                    arr[begin - 1] = temp
                    
                    sortIndex = begin //记录最新交换的位置，那么这个位置就是已排序好的序列的第一个位置
                }
            }
            end  = sortIndex
        }
    }
    
    //冒泡排序优化1，对一个某一轮就能确定有序的数组就不再进行排序。
    func bubbleSort1(_ arr: inout [Int]) {
        var end = arr.count
        
        while end > 0 {
            var hasSorted = true //如果整个数据是有序的，则不进行排序。
            for begin in 1..<end {
                if arr[begin] < arr[begin - 1] {
                    let temp = arr[begin]
                    arr[begin] = arr[begin - 1]
                    arr[begin - 1] = temp
                    hasSorted = false
                }
            }
            
            if hasSorted {
                break
            }
            
            end -= 1
        }
    }
    
    //邻居比较，一轮排序就相当于确定了最后一个元素。
    func bubbleSort0(_ arr: inout [Int]) {
        var end = arr.count
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
            for begin in 1..<end {
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
