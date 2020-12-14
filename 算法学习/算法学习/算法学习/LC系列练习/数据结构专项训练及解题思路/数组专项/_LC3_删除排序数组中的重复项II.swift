//
//  _LC3_移除排序数组中的重复项II.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/13.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension LC3 {
    /*
     删除排序数组中的重复项 II
     给定一个增序排列数组 nums ，你需要在 原地 删除重复出现的元素，使得每个元素最多出现两次，返回移除后数组的新长度。

     不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/all-about-array/x9nivs/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     分析及解题思路：
     根据题目的意思，还是应该使用双指针或3指针。只是需要有另外的字段用来计算个数
     */
    
    /*
     方法一：用双指针计算，调用remove函数移除多余的元素
     */
    func removeDuplicatesII(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else {
            return nums.count
        }
        
        var i = 0
        var j = 1
        var sum = 1
        while j < nums.count {
            
            if nums[j] == nums[i] {
                sum += 1
                if sum > 2 {
                    nums.remove(at: j)
                    sum -= 1
                    // 注意这个细节，移除完之后，j就相当于自动升了序号
                    continue
                }
            }else{
                i = j
                sum = 1
            }
            
            j += 1
        }
        
        return nums.count
    }
    
    /*
    方法二：用三指针计算，不使用remove这种耗时api
    
    总结：这种有序数组里去重的，如果是只保留1个，那基本使用双指针，如果保留2个，那么使用3指针会好很多
     
     
    */
    
    func removeDuplicatesII2(_ nums: inout [Int]) -> Int {
        guard nums.count > 2 else {
            return nums.count
        }
        
        var k = 0
        var i = 1
        var j = 2
        
        while j < nums.count {
            if nums[j] != nums[i] || (nums[j] == nums[i] && nums[i] != nums[k]) {
                k = i
                i += 1
                (nums[i], nums[j]) = (nums[j], nums[i])
            }
            j += 1
        }
        
        return i+1
    }
}
