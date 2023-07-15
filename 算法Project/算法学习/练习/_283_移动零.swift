//
//  _283_移动零.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/23.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Solution {
    /*
     给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

     示例:

     输入: [0,1,0,3,12]
     输出: [1,3,12,0,0]
     说明:

     必须在原数组上操作，不能拷贝额外的数组。
     尽量减少操作次数。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/move-zeroes
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     
     解析：双指针操作
     
     */
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 0 else {
            return
        }
        
        var i = 0
        var j = 0
        while i < nums.count{
            if nums[i] != 0 {
                if i > j && nums[j] == 0 {
                    (nums[i],nums[j]) = (nums[j],nums[i])
                    i += 1
                    j += 1
                    continue
                }
            }
            
            if nums[j] != 0 {
                j += 1
            }
            
            i += 1
        }
        
    }
}
