//
//  _724._寻找数组的中心索引.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/26.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension ArrayList {
    /*
     给定一个整数类型的数组 nums，请编写一个能够返回数组 “中心索引” 的方法。

     我们是这样定义数组 中心索引 的：数组中心索引的左侧所有元素相加的和等于右侧所有元素相加的和。

     如果数组不存在中心索引，那么我们应该返回 -1。如果数组有多个中心索引，那么我们应该返回最靠近左边的那一个。

     输入：
     nums = [1, 7, 3, 6, 5, 6]
     输出：3
     解释：
     索引 3 (nums[3] = 6) 的左侧数之和 (1 + 7 + 3 = 11)，与右侧数之和 (5 + 6 = 11) 相等。
     同时, 3 也是第一个符合要求的中心索引。
     
     **分析**: 如果存在这个索引，则索引前面所有数据的和 == (整个数组和 - 索引位置数值)/2。
     
     */
    func pivotIndex(_ nums: [Int]) -> Int {
        var sum = 0
        for num in nums {
            sum += num
        }
        
        var leftSum = 0 //索引左侧元素和
        for (i,num) in nums.enumerated() {
            //这里不用乘法，是由于函数中除法可能会造成精度问题。所以使用乘法才是最优的
            if (leftSum + num) * 2 == sum + num {
                return i
            }
            leftSum += num
        }
        
        return -1
    }
}
