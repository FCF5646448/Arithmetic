//
//  LC_13_旋转数组.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/11/23.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC {
    /*
     给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。

     示例 1:

     输入: [1,2,3,4,5,6,7] 和 k = 3
     输出: [5,6,7,1,2,3,4]
     解释:
     向右旋转 1 步: [7,1,2,3,4,5,6]
     向右旋转 2 步: [6,7,1,2,3,4,5]
     向右旋转 3 步: [5,6,7,1,2,3,4]
     
     尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
     要求使用空间复杂度为 O(1) 的 原地 算法。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xm42hs/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     方法一：利用swift API，但是性能最差。
     */
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard nums.count > 0 else {
            return
        }

        //因为k可能比整个数组都大
        var newK = k%nums.count
        while newK > 0 {
            let t = nums.removeLast()
            nums.insert(t, at: 0)
            newK -= 1
        }
    }
    
    /*
     最佳方案：
     方法二：参考leetcode
     反转元素：
     [1,2,3,4,5,6,7]
     1、先整体反转： [7,6,5,4,3,2,1]
     2、以k为分割，左右部分分别反转：[5,6,7,1,2,3,4]
     */
    func rotate2(_ nums: inout [Int], _ k: Int) {
        guard nums.count > 0 else {
            return
        }
        //因为k可能比整个数组都大
        let newK = k%nums.count
        
        rotateArr(&nums, 0, nums.count)
        rotateArr(&nums, 0, newK)
        rotateArr(&nums, newK, nums.count)
        
    }
    
    // 反转整个数组
    func rotateArr(_ arr: inout [Int], _ left: Int, _ right: Int) {
        guard left < right else {
            return
        }
        
        var l = left
        var r = right - 1
        while l < r {
            let temp = arr[l]
            arr[l] = arr[r]
            arr[r] = temp
            
            l += 1
            r -= 1
        }
    }
    
    
    
}
