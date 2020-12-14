//
//  _2_快速排序.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/19.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation



extension Sort {
    /*
     快速排序的核心，将所有小于基准数的值，放到基准数左侧，将所有大于基准数的值放到基准数右侧。
     步骤：
     1、以最左侧的数值为基准值；
     2、然后从右往左查找，找到小于等于基准数的值；再从左往右找，找到大于大于基准数的值；然后将查找到的两个元素交换位置；（注意等于很重要）
     3、重复第二步，一直到左右两个下标相遇位置，然后将基准数与相遇位置的数值进行交换；
     4、将数组分成两个数组，每个数组都重复以上步骤。
     
     注意：这里的right是闭区间，是一个真实的下标
     */
    func quickSort(_ arr:inout [Int],_ left:Int, _ right:Int) {
        if left > right {
            return
        }
        var l = left
        var r = right
        let temp = arr[left]
        while l < r {
            //先从右往左查找, 找到小于基准数的值
            while l < r && arr[r] > temp  {
                r -= 1
            }
            //再从左往右查找，找到大于基准数
            while l < r && arr[l] < temp {
                l += 1
            }
            if l < r {
                let tem = arr[l]
                arr[l] = arr[r]
                arr[r] = tem
            }
        }
        
        arr[left] = arr[l]
        arr[l] = temp
        quickSort(&arr, left, r-1)
        quickSort(&arr, r + 1, right)
    }
}
