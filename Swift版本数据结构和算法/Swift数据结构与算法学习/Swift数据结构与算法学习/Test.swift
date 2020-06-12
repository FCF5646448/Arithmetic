//
//  Test.swift
//  Swift数据结构与算法学习
//
//  Created by 冯才凡 on 2020/6/10.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

class Test {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else{
            return 0
        }
        
        var curr = nums[0]
        
        var i = 1
        while i < nums.count {
            if curr == nums[i] {
                nums.remove(at:i)
            }else if curr < nums[i] {
                curr = nums[i]
                i += 1
            }
            print(nums.count)
        }
        return i
    }
    
    func test() {
        var nums = [1,1,2]
        let n = removeDuplicates(&nums)
        print(n)
    }
    
}
