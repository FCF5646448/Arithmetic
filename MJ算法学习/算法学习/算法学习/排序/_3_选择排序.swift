//
//  _3_选择排序.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/19.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension Sort {
    
    func selectSort(_ arr:inout [Int]) {
        var end = arr.count
        while end > 0 {
            var maxIndex = 0
            for begin in 1..<end {
                if arr[begin] > arr[maxIndex] {
                    maxIndex = begin
                }
            }
            
            let temp = arr[maxIndex]
            arr[maxIndex] = arr[end - 1]
            arr[end - 1] = temp
            
            end -= 1
        }
        
    }
    
    func selectSort0(_ arr:inout [Int]) {
        
        var end = arr.count - 1
        while end > 0 {
            /*
             选择排序
             第1轮，找到最大值，跟倒数第1位置交换；
             第2轮，找到倒数第2大值，跟倒数第2大值交换；
             ...
             第i轮，找到倒数第i大值，跟倒数第i大值交换；
             总结：每一轮找到当前范围内的最大值，然后放到当前范围内最后
             */
            var maxIndex = 0
            for begin in 1..<(end + 1) {
                if arr[maxIndex] <= arr[begin] {
                    maxIndex = begin
                }
            }
            
            let temp = arr[maxIndex]
            arr[maxIndex] = arr[end]
            arr[end] = temp
            
            end -= 1
        }
    }
}


