//
//  _35_搜索插入位置.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/26.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension ArrayList {
    /*
     给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

     你可以假设数组中无重复元素。
     
     //首先，是一个有序数组，所以，二分查找应该是最好的选择
     但是一定要注意 每次赋值的+-1操作，以及没有找到的情况。
     */
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        //不使用array的API
        var begin = 0
        var end = nums.count - 1
        while begin <= end {
            let mid = (begin + end)/2
            if nums[mid] == target {
                return mid
            }else if nums[mid] > target {
                end = mid - 1
            }else {
                begin = mid + 1
            }
        }
        return begin
    }
}
