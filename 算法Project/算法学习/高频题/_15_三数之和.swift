//
//  _15_三数之和.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/25.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension HF {
    /*
     15. 三数之和
     给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。

     注意：答案中不可以包含重复的三元组。

      

     示例：

     给定数组 nums = [-1, 0, 1, 2, -1, -4]，

     满足要求的三元组集合为：
     [
       [-1, 0, 1],
       [-1, -1, 2]
     ]
     */
    
    /*
     对暴力法进行优化.
     时间复杂度O(N^2)
     主要是先排序。
     然后确定第2个和第3个元素。
     去掉重复元素
     */
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else{ return []}
        
        var result = [[Int]]()
        // 排序nlogn
        let newNums = nums.sorted(by: <)
        // i 是第一个元素；
        var i = 0
        while i < newNums.count - 2 {
            if i > 0 && newNums[i] == newNums[i - 1] {
                // 第一个元素重复
                i += 1
                continue
            }
            // l 是第二个元素；
            var l = i+1
            // r 是第三个数
            var r = newNums.count - 1
            let remian = 0 - newNums[i]
            
            while l < r {
                let sumLR = newNums[l] + newNums[r]
                if remian == sumLR {
                    // 符合条件
                    result.append([newNums[i],newNums[l],newNums[r]])
                    
                    // 跳过第2个元素的重复元素
                    while l < r && newNums[l] == newNums[l + 1] { l += 1 }
                    // 跳过第2个元素的重复元素
                    while l < r && newNums[r] == newNums[r - 1] { r -= 1 }
                    
                    // 往中间逼近
                    l += 1
                    r -= 1
                }else if sumLR < remian {
                    // 找个更大的值
                    l += 1
                }else{
                    // 找个更小的值
                    r -= 1
                }
            }
            
            i += 1
        }

        return result
    }
}
