//
//  、.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/11/3.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC {
    /*
     给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。
     
     说明：
     初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
     你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
      

     示例：

     输入：
     nums1 = [1,2,3,0,0,0], m = 3
     nums2 = [2,5,6],       n = 3

     输出：[1,2,2,3,5,6]

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xmi2l7/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    // 其实这道题就类似归并排序里的合数据那段, 但是得从大到小，从右到左排序
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var currentIndex = m + n - 1
        var n1Index = m - 1
        var n2Index = n - 1
        
        while currentIndex >= 0 {
            if n1Index >= 0 && n2Index >= 0 {
                if nums1[n1Index] >= nums2[n2Index] {
                    nums1[currentIndex] = nums1[n1Index]
                    n1Index -= 1
                }else{
                    nums1[currentIndex] = nums2[n2Index]
                    n2Index -= 1
                }
                currentIndex -= 1
            }else if n1Index >= 0 {
                nums1[currentIndex] = nums1[n1Index]
                n1Index -= 1
                currentIndex -= 1
            }else if n2Index >= 0 {
                nums1[currentIndex] = nums2[n2Index]
                n2Index -= 1
                currentIndex -= 1
            }
        }
    }
}
