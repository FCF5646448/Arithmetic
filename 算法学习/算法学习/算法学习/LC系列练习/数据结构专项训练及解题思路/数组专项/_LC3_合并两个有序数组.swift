//
//  _LC3_合并两个有序数组.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/14.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC3 {
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
     链接：https://leetcode-cn.com/leetbook/read/all-about-array/x9lhe7/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     分析与解题思路
     首先肯定是使用指针方法，将较大的数先放到nums1的后面。从大往小排序
     其次要注意，如果某一个数组的元素用完了，则需要将另一个数组的剩余元素在排进去。
     
     有点类似归并排序的合并部分。不过，归并排序是将前半部分的数据使用数组先放起来。
     
     */
    
    /*
     方法：尾插法。
     
     */
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        // 使用归并排序的方法，进行排序 , 从后往前排
        var i = nums1.count - 1
        var j = m - 1
        var k = n - 1
        while i >= 0 && j >= 0 && k >= 0 {
            if (nums1[j] >= nums2[k]) {
                nums1[i] = nums1[j]
                j -= 1
            }else if k >= 0 {
                nums1[i] = nums2[k]
                k -= 1
            }
            i -= 1
        }
        if j >= 0 {
            while i >= 0  {
                nums1[i] = nums1[j]
                j -= 1
                i -= 1
            }
        }else if k >= 0 {
            while i >= 0  {
                nums1[i] = nums2[k]
                k -= 1
                i -= 1
            }
        }
    }
    
    func mergetest() {
        var num = [2,1,4,3,5,7,9,0,8]
        mergeSort(&num, 0, num.count)
        print(num)
    }
    
    // 先拆 左闭右开
    func mergeSort(_ nums: inout [Int], _ left: Int, _ right: Int) {
        guard right - left > 1 else { //切到只有一个元素为止
            return
        }
        
        let md = (left + right) >> 1
        mergeSort(&nums, left, md)
        mergeSort(&nums, md, right)
        
        merge(&nums, left, md, right)
    }

    // 左闭右开
    // 只要将小数组合并好就相当于都合并好了。
    func merge(_ nums: inout [Int], _ l: Int, _ m: Int, _ r: Int) {
        
        var li = 0
        let le = m - l
        var ri = m
        let re = r
        
        
        var temp = [Int]()
        for i in li ..< le {
            temp.append(nums[i + l])
        }
        
        // 小数组放进去了就可以了
        var i = l
        while li < le {
            if ri < re && nums[ri] < temp[li] {
                nums[i] = nums[ri]
                ri += 1
            }else{
                nums[i] = temp[li]
                li += 1
            }
            i += 1
        }
    }
}

