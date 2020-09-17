//
//  _75_颜色分类.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/20.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


/*
 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
 
 一个直观的解决方案是使用计数排序的两趟扫描算法。
 首先，迭代计算出0、1 和 2 元素的个数，然后按照0、1、2的排序，重写当前数组。
 你能想出一个仅使用常数空间的一趟扫描算法吗？

 要求空间复杂度是O(1),时间负责度是O(n) , 说明不是之前学过的排序算法
 */


extension ArrayList {
    //一般这种要求扫码一遍就排好序的，那就得使用双指针或者三指针解决
    /*
     这里则要利用三指针来处理，使用一个指针A指向当前位置，使用一个指针B指向左侧位置，使用一个指针C指向右侧位置。
     当前位置是1：跳过；
     当前位置是0：跟指针B交换数据，然后当前指针A++，指针B++
     当前位置是2：跟指针C交换数据，指针C--；然后再判断当前指针A，重复上诉步骤。
     */
    func sortColors(_ nums: inout [Int]) {
        
        var curr = 0
        var left = 0
        var right = nums.count - 1
        
        while curr <= right {
            if nums[curr] == 1 {
                curr += 1
            }else if nums[curr] == 0 {
                let temp = nums[curr]
                nums[curr] = nums[left]
                nums[left] = temp
                curr += 1
                left += 1
            }else{
                let temp = nums[curr]
                nums[curr] = nums[right]
                nums[right] = temp
                right -= 1
            }
        }
    }
    
    func sortColors2(_ nums: inout [Int]) {
        var left = 0
        var right = nums.count - 1
        var current = 0
        while current <= right {
            if nums[current] == 2 && current < right {
                let temp = nums[right]
                nums[right] = nums[current]
                nums[current] = temp
                right -= 1
            }else if nums[current] == 0 && current > left {
                let temp = nums[left]
                nums[left] = nums[current]
                nums[current] = temp
                left += 1
            }else{
                current += 1
            }
        }
    }
}
