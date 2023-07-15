//
//  JZ_53_2_0_n-1缺失的数字.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/3/22.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation


extension JZ {
    // 0~n-1缺失的数字
    /// 一个长度为n-1的递增排序数组中的所有数字都是唯一的，并且每个数字都在范围0～n-1之内。在范围0～n-1内的n个数字中有且只有一个数字不在该数组中，请找出这个数字。
    func missingNumber(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var l = 0
        var r = nums.count - 1
        while l <= r {
            let mid = (l + r) / 2
            if nums[mid] == mid {
                l = mid + 1
            }else {
                // 只会出现大于等于的情况。所以找到前一个是等于的下标的后一个就是目标值
                if mid - 1 < 0 || nums[mid - 1] == (mid - 1) {
                    return mid
                }else{
                    // 大于
                    r = mid - 1
                }
            }
        }
        return nums.count
    }
}
