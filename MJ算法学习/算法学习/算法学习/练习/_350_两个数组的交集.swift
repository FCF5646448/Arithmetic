//
//  _350_两个数组的交集.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/22.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Solution {
    /*
     //使用哈希表，注意重复元素
     [1,2,2,1], [1,2,2]
     */
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        guard nums1.count > 0 || nums2.count > 0 else {
            return []
        }
        
        
        var dic = [Int:Int]()
        var result = [Int]()
        if nums1.count < nums2.count {
            for n in nums1 {
                if dic[n] != nil {
                    dic[n]! += 1
                }else{
                    dic[n] = 1
                }
            }
            
            for n in nums2 {
                if dic[n] != nil && dic[n]! > 0 {
                    dic[n]! -= 1
                    result.append(n)
                }
            }
            
        }else{
            for n in nums2 {
                if dic[n] != nil {
                    dic[n]! += 1
                }else{
                    dic[n] = 1
                }
            }
            
            for n in nums1 {
                if dic[n] != nil && dic[n]! > 0 {
                    dic[n]! -= 1
                    result.append(n)
                }
            }
        }
        
        return result
    }
}
