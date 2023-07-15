//
//  _3_LC_移动零.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/13.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC3 {
    /*

     给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

     示例:

     输入: [0,1,0,3,12]
     输出: [1,3,12,0,0]
     说明:

     必须在原数组上操作，不能拷贝额外的数组。
     尽量减少操作次数。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/all-about-array/x9rh8e/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    

    /*
     分析与解题思路：
     1、从题目说明，必须在原数组进行操作，不能拷贝额外数组。
     那么可想而知，必须原数组中操作又得移动元素，那肯定必须是双指针解题
     
     2、只要是使用双指针的题，那必定存在一个动，一个不动的情况。
     
     3、所以确定哪个动，哪个不动就是关键。
     
     */

    
    
    /*
     双指针方法一：非0前移。最优
     */
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 0 else {
            return
        }
        
        var i = 0
        var zeroIndex = 0
        
        while i < nums.count {
            if nums[i] != 0 {
                // 找到一个非0，那么可能需要前移。
                if i > zeroIndex && nums[zeroIndex] == 0 {
                    //移动
                    (nums[i], nums[zeroIndex]) = (nums[zeroIndex], nums[i])
                }
            }
            
            if nums[zeroIndex] != 0 {
                // 当前元素不是0，前移
                zeroIndex += 1
            }
            
            i += 1
            
        }
    }
    
    /*
     双指针方法一：0后移。
     */
    func moveZeroes2(_ nums: inout [Int]) {
        guard nums.count > 0 else {
            return
        }
        
        var zeroIndex = 0
        var nonZeroIndex = 0
        
        while zeroIndex < nums.count && nonZeroIndex < nums.count {
            if nums[zeroIndex] == 0 {
                // 需要后移
                if nums[nonZeroIndex] == 0 || nonZeroIndex <= zeroIndex {
                    nonZeroIndex += 1
                    continue
                }else {
                    // 找到非0，交换
                    (nums[zeroIndex], nums[nonZeroIndex]) = (nums[nonZeroIndex], nums[zeroIndex])
                    nonZeroIndex += 1
                }
            }
            
            zeroIndex += 1
        }
        
    }
}
