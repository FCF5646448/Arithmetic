//
//  LC_16_递增的三元子序列.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/11/27.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension LC {
    /*
     给定一个未排序的数组，判断这个数组中是否存在长度为 3 的递增子序列。

     数学表达式如下:

     如果存在这样的 i, j, k,  且满足 0 ≤ i < j < k ≤ n-1，
     使得 arr[i] < arr[j] < arr[k] ，返回 true ; 否则返回 false 。
     说明: 要求算法的时间复杂度为 O(n)，空间复杂度为 O(1) 。

     示例 1:

     输入: [1,2,3,4,5]
     输出: true

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xmb141/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    
    /*
     这道题的精妙解法：就是用两个临时变量存储最小值和中间值。
     将最小值和中间值初始化为Int最大值是非常关键的。这样，找到第三个数的时候，肯定是在已找到前两个数的前提下的。
     其次是替换规则。
     */
    func increasingTriplet(_ nums: [Int]) -> Bool {
        guard nums.count > 2 else {
            return false
        }
        var min = Int.max
        var mid = Int.max
        
        for n in nums {
            if n <= min {
                min = n
            }else if n <= mid {
                mid = n
            }else if n > mid {
                return true
            }
        }
        return false
    }
}
