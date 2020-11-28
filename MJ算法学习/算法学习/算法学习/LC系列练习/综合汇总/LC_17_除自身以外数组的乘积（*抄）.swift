//
//  LC_17_除自身以外数组的乘积（*抄）.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/11/28.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC {
    /*
     除自身以外数组的乘积
     给你一个长度为 n 的整数数组 nums，其中 n > 1，返回输出数组 output ，其中 output[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积。

      

     示例:

     输入: [1,2,3,4]
     输出: [24,12,8,6]
      

     提示：题目数据保证数组之中任意元素的全部前缀元素和后缀（甚至是整个数组）的乘积都在 32 位整数范围内。

     说明: 请不要使用除法，且在 O(n) 时间复杂度内完成此题。

     进阶：
     你可以在常数空间复杂度内完成这个题目吗？（ 出于对空间复杂度分析的目的，输出数组不被视为额外空间。）

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xmf6z5/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     
     */
    
    
    /*
     不能用除法
     方法1：使用两个数组，分别来存储当前元素左侧的元素乘积 和 当前元素右侧的元素乘积
     
     */
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else {
            return []
        }
        
        var L = Array(repeating: 1, count: nums.count)
        var R = Array(repeating: 1, count: nums.count)
        
        L[0] = 1 // 注意这个赋值
        var i = 1
        while i < nums.count {
            let n = nums[i - 1]
            L[i] = L[i-1] * n
            i += 1
        }
        
        i = nums.count - 1
        R[i] = 1 // 注意这个赋值
        i -= 1
        while i >= 0 {
            let n = nums[i + 1]
            R[i] = R[i+1] * n
            i -= 1
        }
        
        var newArr = [Int]()
        i = 0
        while i < nums.count {
            newArr.append(L[i] * R[i])
            i += 1
        }
        
        return newArr
    }
    
}
