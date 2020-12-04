//
//  LC_18_数组中的第K个最大元素.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/4.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension LC {
    /*
     在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

     示例 1:

     输入: [3,2,1,5,6,4] 和 k = 2
     输出: 5
     示例 2:

     输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
     输出: 4
     说明:

     你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xal9h6/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     top k问题，很显然，使用堆
     做一个能存K个元素的堆
     第K个最大元素。说明要的是一个小顶堆。堆顶是最小值，也就是第k大的元素。越往底层，元素值越大
     */
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count >= k else {
            return Int.max
        }
        
        // 创建一个数组，用于存放堆里面的数据。
        var heap = [Int]()
        for i in 0..<k {
            heap.append(nums[i])
        }
        
        // 对已有数组进行下滤，让其成堆
        // 从第一个非叶子节点开始执行下滤，第一个非叶子节点的下标就是 count/2-1
        var i = k/2 - 1
        while i >= 0 {
            siftdown(&heap, i, k)
            i -= 1
        }
        
        // 把剩余的元素进行入堆，替换掉不符合标准的元素。就是把前k大的元素留在堆里
        for i in k..<nums.count {
            if heap[0] < nums[i] {
                //符合要求的元素入堆（替换掉堆顶元素）。
                heap[0] = nums[i]
                // 对堆顶元素进行下滤
                siftdown(&heap, 0, k)
            }
            
        }
        
        return heap[0]
    }
    
    /*
     下率
     将第index下标的元素进行下滤。index表示在堆中的下标。nums表示堆的元素。size表示堆的元素个数
     */
    func siftdown(_ nums: inout [Int], _ index: Int , _ size: Int) {
        let element = nums[index]
        var i = index
        while i < size/2 { // size/2 === 第一个叶子节点的下标索引 === 非叶子节点的个数
            var childIndex = i * 2 + 1 // 左子节点下标
            var child = nums[childIndex]
            
            let rightChildIndex = childIndex + 1
            if rightChildIndex < size && nums[rightChildIndex] < child {
                // 存在右子节点，且右子节点比左子节点小，就交互（小顶堆，越小的元素在越上面）
                childIndex = rightChildIndex
                child = nums[rightChildIndex]
            }
            guard element > child else {
                // 当当前元素比子节点元素更大，就进行下滤。因为是小顶堆，所以越大的数就越在下面
                break
            }
            
            // 交互当前元素和子节点，继续对子节点进行下滤操作
            nums[i] = child
            
            i = childIndex
            
        }
        // 将元素放到最终位置
        nums[i] = element
    }
    
    
}
