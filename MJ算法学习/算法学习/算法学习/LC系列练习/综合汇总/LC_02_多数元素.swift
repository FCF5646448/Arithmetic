//
//  LC_02_多数元素.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/11/2.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC {
    /*
     给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。

     你可以假设数组是非空的，并且给定的数组总是存在多数元素。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xm77tm/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     
     
     
     */
    func majorityElement(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return Int.min
        }
        
        var dic = [Int : Int]()
        var maxN = Int.min
        
        for n in nums {
            if dic[n] != nil {
                dic[n] = dic[n]! + 1
                if dic[n]! > dic[maxN]! {
                    maxN = n
                }
            }else{
                dic[n] = 1
                if maxN == Int.min {
                    maxN = n
                }
            }
        }
        
        return maxN
    }
}
