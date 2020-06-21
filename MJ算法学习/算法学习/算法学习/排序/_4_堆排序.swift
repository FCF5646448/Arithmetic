//
//  _4_堆排序.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/19.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Sort {
    func heapSort(_ arr:inout [Int]) {
        var size = arr.count
        //原地建堆
        var i = size/2 - 1
        while i >= 0 {
            siftdown(&arr,i)
            i -= 1
        }
        while size > 1 {
            //交换堆顶元素和尾元素
            size -= 1
            let temp = arr[0]
            arr[0] = arr[size]
            arr[size] = temp
            //对0位置进行siftdown
            siftdown(&arr, 0)
        }
    }
    
    //自下而上的下虑
    func siftdown(_ arr:inout [Int], _ index:Int) {
        var i = index
        let element = arr[i]
        let size = arr.count
        let half = size/2
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
            if element > child {
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
