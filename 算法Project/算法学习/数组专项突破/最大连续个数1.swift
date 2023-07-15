//
//  最大连续个数1.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/4/15.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension ArrayList {
    /*
     给定一个二进制数组， 计算其中最大连续 1 的个数。

      

     示例：

     输入：[1,1,0,1,1,1]
     输出：3
     解释：开头的两位和最后的三位都是连续 1 ，所以最大连续 1 的个数是 3.

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/array-and-string/cd71t/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        guard nums.count > 0 else{
            return 0
        }
        var slow = 0
        var fast = 0
        var sum = 0
        while fast < nums.count {
            if nums[fast] == 1 {
                sum = max(sum, fast - slow + 1)
            }else{
                fast += 1
                slow = fast
                continue
            }
            fast += 1
        }
        return sum
    }
    
}
