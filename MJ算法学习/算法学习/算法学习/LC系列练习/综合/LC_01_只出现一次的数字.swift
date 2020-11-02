//
//  LC_只出现一次的数字.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/11/2.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension LC {
    /*
     给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
     输入: [2,2,1]
     输出: 1
     
     01010101
     00110011
    -----------
     10011001
     01010101
    -----------
     00110011
     
     */
    func singleNumber(_ nums: [Int]) -> Int {
        var single = 0
        for i in nums {
            single ^= i
        }
        return single
    }
}

