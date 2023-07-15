//
//  _1_有序数组中目标数字的重复个数.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/30.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension MS {
    /*
     给定一个有序数组和一个目标值，求出目标值的重复次数
     */
    func numOfTarget(_ nums:[Int], _ target: Int) -> Int{
        guard nums.count > 0 else {
            return 0
        }
        
        var l = 0
        var r = nums.count - 1
        while l < r {
            let m = (l + r)/2
            if nums[m] == target {
                var i = m - 1
                var j = m + 1
                var sum = 1
                while i > l || j < r {
                    if nums[i] == target {
                        i -= 1
                        sum += 1
                    }
                    
                    if nums[j] == target {
                        j += 1
                        sum += 1
                    }
                    
                    if nums[i] != target && nums[j] != target {
                        break
                    }
                }
                return sum
            }else if nums[m] < target{
                l = m
            }else {
                r = m
            }
        }
        return 0
    }
}

