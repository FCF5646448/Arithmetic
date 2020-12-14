//
//  _3LC_移除元素.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/13.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC3 {
    /*
     移除元素
     给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。

     不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。

     元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/all-about-array/x9p1iv/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     分析与解题思路：
     1、不使用额外的空间且要移动元素，那么肯定双指针是最好的解法。
     
     2、根据题意，是把与val相等的元素移到数组后面，返回返回新的长度。那么一个指针在前，一个指针在后的手法是最好的。
     
     3、但是要注意循环结束条件以及特殊情况
     
     */
    
    /*
     方法：双指针
     */
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard nums.count > 0 else {
            return nums.count
        }
        
        var i = 0
        var j = nums.count - 1
        while i < j {
            if val == nums[i] {
                if val == nums[j] {
                    j -= 1
                    continue
                }else{
                    // 交换
                    (nums[i], nums[j]) = (nums[j], nums[i])
                    j -= 1
                }
            }
            
            i += 1
        }
        
        if i == j && val == nums[j] {
            j -= 1
        }
        
        return j + 1
        
    }
}
