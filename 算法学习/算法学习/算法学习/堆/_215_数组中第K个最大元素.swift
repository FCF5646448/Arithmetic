//
//  _215_数组中第K个最大元素.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/9/1.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Heap {
    /*
     在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
     */
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        // 先原地建一个小顶堆
        var heap = [Int]()
        for i in 0..<k {
            heap.append(nums[i])
        }
        
        //从堆的第一个非叶子节点开始进行下滤，使得数组成为堆
        let size = k
        var i = size/2 - 1
        while i >= 0 {
            siftDown3(&heap, i, size)
            i -= 1
        }
        print(heap)
        // 将剩余元素跟堆顶元素比较，替换掉小的元素
        for i in k..<nums.count {
            if heap[0] < nums[i] {
                heap[0] = nums[i]
                siftDown3(&heap, 0, size)
            }
        }
        return heap[0]
    }

    //下滤 小顶堆 堆顶就是第K个最大元素。大于堆顶元素就入堆，进行下滤
    func siftDown3(_ nums: inout [Int], _ index: Int, _ size: Int) {
        let element = nums[index]
        var i = index
        while i < size/2 {
            var childIndex = 2*i + 1
            var child = nums[childIndex]

            let rightChildIndex = childIndex + 1
            if rightChildIndex < size && nums[rightChildIndex] < child {
                //取最小的数
                childIndex = rightChildIndex
                child = nums[rightChildIndex]
            }
            guard element > child else{
                //
                break
            }
            nums[i] = child
            i = childIndex
        }
        nums[i] = element
    }
}


extension Heap {
    
    func bild(_ nums: [Int], _ k: Int) -> [Int] {
        var heap = [Int]()
        for i in 0..<k {
            heap.append(nums[i])
        }
        
        // 自动建堆
        //从堆的第一个非叶子节点开始进行下滤，使得数组成为堆
        var i = k/2 - 1
        while i >= 0 {
            shiftD(&heap, i, k)
            i -= 1
        }
        
        
        //其余数据入堆
        for i in k..<nums.count {
            if heap[0] < nums[i] {
                heap[0] = nums[i]
                shiftD(&heap, 0, k)
            }
        }
        
        return heap
    }
    
    func shiftD(_ nums: inout [Int], _ index: Int, _ size: Int) {
        let element = nums[index]
        var i = index
        while i < size/2 {
            var childIndex = 2 * i + 1
            var child = nums[childIndex]
            
            let rightChildIndex = childIndex + 1
            if rightChildIndex < size && nums[rightChildIndex] < child {
                childIndex = rightChildIndex
                child = nums[rightChildIndex]
            }
            
            guard child > element else{
                break
            }
            
            nums[i] = child
            i = childIndex
        }
        nums[i] = element
    }
}
