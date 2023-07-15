//
//  _LC3_长度最小的子数组.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/17.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC3{
    /*
     长度最小的子数组
     给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的 连续 子数组，并返回其长度。如果不存在符合条件的子数组，返回 0。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/all-about-array/x9gogt/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     
     */
    /*
     解法：滑动窗口
     滑动窗口方法，需要确定3个问题
     1、窗口里存放的是什么？
     2、窗口的起始位置怎么确定？
     3、窗口的结束位置怎么确定？
     
     滑动窗口始终要存取大于等于子序列的和
     如果窗口中的元素和大于target，则起始位置后移（窗口缩小）；如果小于target，则结束位置后移（窗口放大）
     */
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var i = 0
        var j = 0
        var result = Int.max
        var sum = 0
        while j < nums.count {
            sum += nums[j]
            while sum >= s {
                result = min(result, j - i + 1)
                sum -= nums[i]
                i += 1
            }
            j += 1
        }
        return result == Int.max ? 0 : result
    }
}
