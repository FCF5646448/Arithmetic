//
//  _5_插入排序.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/5.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Sort {
    /*
     * 插入排序就类似打牌，数组前面的元素是已排好序的，每查找一个元素，就得将其插入到数组合适的位置中。
     * 逆序对：加入元素数组为[3,2,1]，那逆序对就是<3,2>,<3,1>,<2,1>。插入排序的时间复杂度跟“逆序对”的数量成正比;所以插入排序的最好的时间复杂度是O(n),最坏的时间复杂度就是O(n^2)
     * 插入排序有个优化的点，就是可以在前面的已排序数列进行二分查找，找到合适位置。然后把数据插入进去。
     */
    func insertSort(_ arr:inout [Int]) {
        /*
         * 默认第一个元素是已经排好序的，所以begin从1开始。
         * 在排序过程中，相当于begin之前的元素都是有序的，begin之后的元素都是无序的。
         */
        
        var begin = 1
        while begin < arr.count {
            var curr = begin
            while curr > 0 && arr[curr] < arr[curr - 1] {
                //需要交换位置，则跟它前一个交换，交换完成后继续遍历前面的元素，比较大小，直到已经到了一个合适的位置。
                let temp = arr[curr - 1]
                arr[curr - 1] = arr[curr]
                arr[curr] = temp
                curr -= 1
            }
            
            begin += 1
        }
    }
}
