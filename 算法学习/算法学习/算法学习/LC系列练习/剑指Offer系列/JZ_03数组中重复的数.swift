//
//  JZ_03数组中重复的数.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/2/21.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension JZ {
    /*
     题目：找出数组中重复的数
     在一个长度为n的数组里的所有数字都在0~n-1的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。
     例如，如果输入长度为7的数组{2，3，1，0，2，5，3}，那么对应的输出是重复的2或3
     */
    
    
    /*
     解析：
     所有数字都在0~n-1以内。则可以利用哈希表的方式。
     但是这样就会浪费一个数组的空间大小
     */
    func duplicate(numbers:[Int]) -> [Int] {
        
        var boolArr = Array(repeating: false, count: numbers.count - 1)
        var result: [Int] = []
        for n in numbers {
            if boolArr[n] {
                result.append(n)
            }else{
                boolArr[n] = true
            }
        }
        
        return result
    }
    
    /*
     解析：
     所有的数字都是在0~n-1以内。
     可以通过下标重排整个数组
     */
    func duplicate2(_ numbers: inout [Int]) -> [Int] {
        var result: [Int] = []
        var i = 0
        while i < numbers.count {
            let m = numbers[i]
            if i == m {
                //元素值和下标一样，则符合
                i += 1
                continue
            }else{
                // 元素值和下标值不一致。
                if numbers[i] == numbers[numbers[i]] {
                    // 下标为numbers[i]存在同样元素值的元素，则为重复元素
                    result.append(numbers[i])
                    i += 1
                }else{
                    // 交换
                    (numbers[i],numbers[m]) = (numbers[m], numbers[i])
                }
            }
        }
        return result
    }
    
    
}
