//
//  _LC3_删除排序数组中的重复项.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/13.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension LC3 {
    /*
     给定一个排序数组，你需要在 原地 删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。

     不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

      

     示例 1:

     给定数组 nums = [1,1,2],

     函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。

     你不需要考虑数组中超出新长度后面的元素。
     示例 2:

     给定 nums = [0,0,1,1,1,2,2,3,3,4],

     函数应该返回新的长度 5, 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4。

     你不需要考虑数组中超出新长度后面的元素。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/all-about-array/x9a60t/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     分析与解题思路
     1、数组是已排好序的数组很关键
     2、空间复杂度为1，那么又可以考虑使用双指针
     
     */
    
    /*
     方法1：双指针, 直接调用remove移除nums的元素
     */
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else {
            return nums.count
        }
        
        var i = 0
        var j = 1
        
        while j < nums.count {
            if nums[i] == nums[j] {
                nums.remove(at: j)
                // 这里要注意，移除完成后，不要移到i
                continue
            }else{
                j += 1
            }
            
            i += 1
        }
        
        return nums.count
    }
    
    /*
     方法2：双指针。因为有返回长度，所以可以不使用remove函数，因为整个函数本身也很耗性能。所以把不重复的元素前移。保证[0,i]范围内的元素是不重复的
     */
    func removeDuplicates2(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else {
            return nums.count
        }
        
        var i = 0
        var j = 1
        
        while j < nums.count {
            if nums[i] != nums[j] {
                (nums[i+1], nums[j]) = (nums[j], nums[i+1])
                i += 1
            }
            j += 1
        }
        return i + 1
    }
    
    
}
