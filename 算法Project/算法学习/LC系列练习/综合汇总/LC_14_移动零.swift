//
//  LC_14_移动零.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/11/23.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC {
    /*
     给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

     示例:

     输入: [0,1,0,3,12]
     输出: [1,3,12,0,0]
     说明:

     必须在原数组上操作，不能拷贝额外的数组。
     尽量减少操作次数。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xmy9jh/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     方法：
     使用双指针
     */
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        var curI = 0
        var movI = 1
        
        while movI < nums.count {
            if nums[curI] == 0 {
                if nums[movI] == 0 {
                    movI += 1
                    continue
                }else{
                    let temp = nums[movI]
                    nums[movI] = nums[curI]
                    nums[curI] = temp
                }
            }
            
            curI += 1
            movI += 1
            
        }
        
    }
}
