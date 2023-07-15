//
//  _0_TopK找出数组中前k个最小数.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/2.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Heap {
    /*
     前k个最小值，建大顶堆。
     */
    func minTok(_ arr: inout [Int], _ k:Int) -> [Int] {
        func siftDown(_ arr:inout [Int],_ index:Int, _ size:Int) {
            var i = index
            let element  = arr[i]
            
            while i < size/2 {
                //第一个非叶子节点开始
                var childIndex = 2*i + 1
                var child = arr[childIndex]
                
                let rightChildIndex = childIndex + 1
                let rightChild = arr[rightChildIndex]
                if rightChildIndex < size && child < rightChild {
                    //取最大的数
                    childIndex = rightChildIndex
                    child = rightChild
                }
                
                if element >= child {
                    break
                }
                //下虑
                arr[i] = child
                i = childIndex
            }
            arr[i] = element
        }
        
        //先将前k个数进行原地建一个小顶堆，然后将其他的元素进行replace
        var heap = [Int]()
        for i in 0..<k {
            heap.append(arr[i])
        }
        
        //从堆的第一个非叶子节点开始进行下滤，使得数组成为堆
        let size = k
        var i = size/2 - 1
        while i >= 0 {
            siftDown(&heap, i, size)
            i -= 1
        }
        
        //比较，如果元素比堆顶元素小，则替换堆顶元素，然后调整堆。
        for i in k..<arr.count {
            if heap[0] > arr[i]  {
                heap[0] = arr[i]
                siftDown(&heap, 0, size)
            }
        }
        
        return heap
        
    }
    
}
