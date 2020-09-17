//
//  _88_合并两个有序数组.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/20.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension ArrayList {
    /*
     思想就是使用归并排序的方式，从后往前排
     初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
     你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
     
     解析：双指针算法
     */
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var n1e = m - 1
        var n2e = n - 1
        var curr = nums1.count - 1
        // 这种方式就是归并排序的merge方式
        while n2e >= 0 {
            if n1e >= 0 && nums2[n2e] < nums1[n1e] {
                nums1[curr] = nums1[n1e]
                curr -= 1
                n1e -= 1
                
            }else{
                nums1[curr] = nums2[n2e]
                curr -= 1
                n2e -= 1
            }
        }
    }
    
    func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i1 = m - 1
        var i2 = n - 1
        var i = nums1.count - 1
        while i >= 0 {
            if i1 >= 0 && i2 >= 0 {
                if nums1[i1] >= nums2[i2] {
                    nums1[i] = nums1[i1]
                    i1 -= 1
                }else{
                    nums1[i] = nums2[i2]
                    i2 -= 1
                }
            }else if i1 >= 0 {
                nums1[i] = nums1[i1]
                i1 -= 1
            }else{
                nums1[i] = nums2[i2]
                i2 -= 1
            }
            i -= 1
        }
    }
    
}

