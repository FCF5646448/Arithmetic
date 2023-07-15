//
//  _HF_283_移动零.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/25.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension HF {
    /*

     给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

     示例:

     输入: [0,1,0,3,12]
     输出: [1,3,12,0,0]
     说明:

     必须在原数组上操作，不能拷贝额外的数组。
     尽量减少操作次数。
     */
    
    /*
     解题思路
     要使非0的数保持原有的顺序，则做法就一个是就非0的数依次移动到前面去。
     使用两个指针cur和index分别表示当前为0的数和当前为1的数
     1、当nums[cur] == 0 && nums[index] != 0；交换
     2、当nums[index] == 0; index移动
     3、当nums[cur] != 0; cur移动
     4、注意，当index == cur ,index移动
     */
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 0 else {
            return
        }
        
        var cur = 0
        var index = 0
        while index < nums.count {
            if index == cur {
                index += 1
                continue
            }
            
            if nums[index] != 0 && nums[cur] == 0 {
                nums[cur] = nums[index]
                nums[index] = 0
                index += 1
                cur += 1
                continue
            }
            
            
            if nums[index] == 0 {
                index += 1
                continue
            }
            
            if nums[cur] != 0 {
                cur += 1
                continue
            }
            
        }
        
    }
    
    //
    func moveZeroes2(_ nums: inout [Int]) {
        guard nums.count > 0 else {
            return
        }
        
        var cur = 0
        for i in 0..<nums.count {
            if nums[i] == 0 { continue }
            //能到这里说明  nums[i] != 0
            if cur != i {
                nums[cur] = nums[i]
                nums[i] = 0
            }
            cur += 1
        }
    }
}
