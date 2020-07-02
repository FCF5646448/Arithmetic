//
//  _4_堆排序.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/19.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Sort {
    /*
     所有top k问题都涉及堆排序
     */
    func heapSort(_ arr:inout [Int]) {
        var size = arr.count
        //原地建堆
        var i = size/2 - 1
        while i >= 0 {
            siftdown(&arr,i,size)
            i -= 1
        }
        
        while size > 1 {
            //交换堆顶元素和尾元素,然后堆的size-1，相当于堆的数据-1，则size范围之外的数据是排好序的。
            size -= 1
            let temp = arr[0]
            arr[0] = arr[size]
            arr[size] = temp
            //对0位置进行siftdown
            siftdown(&arr, 0, size)
        }
    }
    
    //自下而上的下虑
    /*
     下虑：
     如果node < 子节点，与最大的子节点交换位置；
     如果node >= 子节点或者没有子节点，退出循环
     必须保证index的位置是第一个非叶子节点，也就是 index < size/2
     */
    func siftdown(_ arr:inout [Int], _ index:Int, _ size:Int) {
        var i = index
        let element = arr[i]
//        let size = arr.count
        let half = size/2 //第一个非叶子节点索引是size/2
        //从第一个非叶子节点开始下虑
        while i < half {
            //默认取出左子节点
            var childIndex = i * 2 + 1
            var child = arr[childIndex]
            //比较左右子节点，确保child是左右子节点中的最大值
            let rightIndex = childIndex + 1
            if rightIndex < size && arr[rightIndex] > child {
                childIndex = rightIndex
                child = arr[rightIndex]
            }
            if element >= child {
                //如果当前元素大于最大子节点，则无需下虑
                break
            }
            //下虑
            arr[i] = child
            i = childIndex
        }
        arr[i] = element
    }
}
