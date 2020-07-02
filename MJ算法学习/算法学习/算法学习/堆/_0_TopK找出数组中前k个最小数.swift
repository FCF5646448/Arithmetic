//
//  _0_TopK找出数组中前k个最小数.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/2.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Heap {
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
                if rightChildIndex < size && child >= rightChild {
                    //取最小的数
                    childIndex = rightChildIndex
                    child = rightChild
                }
                
                if element <= child {
                    break
                }
                //下虑
                arr[i] = child
                i = childIndex
            }
            arr[i] = element
        }
        
        //先将前n个数原地建一个小顶堆，然后将其他的元素进行replace
        var heap = [Int]()
        for i in 0..<arr.count {
            if heap.count < k {
                //建堆
                
                
            }else{
                
                
            }
        }
    }
    
}
