//
//  JZ_53在排序数组中查找数字.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/3/21.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension JZ {
    //53-1 在排序数组c中查找数字出现的个数
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var left = 0
        var right = nums.count - 1
//        if left == right && nums[left] == target {
//            return 1
//        }
        var mid = -1
        var find = false
        while left <= right {
            mid = (left + right) / 2
            
            if nums[mid] > target {
                right = mid - 1
            }else if nums[mid] < target {
                left = mid + 1
            }else {
                find = true
                break
            }

        }
        if mid != -1 && find {
            var num = 1
            var i = 1 //距离mid的距离
            while (mid - i) >= 0 || (mid + i) <= (nums.count - 1) {
                var isEqual = false
                if (mid - i) >= 0  && nums[mid - i] == target {
                    isEqual = true
                    num += 1
                }
                if (mid + i) <= (nums.count - 1) && nums[mid + i] == target {
                    isEqual = true
                    num += 1
                }
                
                if !isEqual {
                    break
                }
                i += 1
            }
            return num
        }
        return 0
    }
}
