//
//  _LC3_数组中的第K个最大元素.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/14.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC3 {
    
    /*
     数组中的第K个最大元素
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
     链接：https://leetcode-cn.com/leetbook/read/all-about-array/x90rpm/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     一般这种TopK问题，首选解法都是堆排序
     */
    
    /*
     解法一：堆排序：
     第一步：自建堆，大小为K，用来存储最大的K个元素。
        因为要求第K大的元素，所以要建小顶堆，保证第K大的元素正好是在堆顶的位置。
        因为堆本身就是一个平衡二叉树，堆的存储方式就是用数组按二叉树的层次遍历进行存储的。
        所以自建堆，可以让一个数组先装好堆里的元素，然后调整元素的顺序，以达到堆的特性。
        调整的话，是从堆的第一个非叶子节点开始进行调整的(注意：第一个非叶子节点的下标是size/2-1），如果是大顶堆，则父节点要大于所有子节点，如果是小顶堆的话，父节点要小于所有子节点
     第二步：将剩余的元素与堆顶元素比较，如果比堆顶大，就替换掉堆顶元素，然后进行调整。
     
     */
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = [Int]()
        for i in 0..<k {
            heap.append(nums[i])
        }
        
        //调整, 从第一个非叶子节点开始调整
        let size = k
        var i = size/2 - 1
        while i >= 0 {
            shiftDown(&heap, i, size)
            i -= 1
        }
        
        // 查看剩余的元素
        i = k
        while k < nums.count {
            if nums[i] > heap[0] {
                heap[0] = nums[i]
                shiftDown(&heap, 0, size)
            }
        }
        
        return heap[0]
    }
    
    private func shiftDown(_ nums: inout [Int], _ index: Int, _ size: Int) {
        let element = nums[index]
        var i = index //对下标index元素进行调整
        while i < size/2 { //一直调整到最后一个非叶子节点为止
            var childIndex = 2*i + 1 //第i个元素的左子节点下标
            var child = nums[childIndex]
            
            // 大元素下虑，所以取左右子树的最小值
            let rChildIndex = childIndex + 1
            if rChildIndex < size && nums[rChildIndex] < child {
                child = nums[rChildIndex]
                childIndex = rChildIndex
            }
            guard element > child else {
                // 小顶堆，大元素下虑
                break
            }
            nums[i] = child
            i = childIndex
        }
        nums[i] = element
    }
    
    /*
     方法2：快速排序 略
     因为
     */
//    func findKthLargestII(_ nums: [Int], _ k: Int) -> Int {
//
//        var n = nums
//        quickSort(&n, 0, n.count - 1)
//
//        return 0
//    }
//
//    private func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int) {
//        //
//        if left > right {
//            return
//        }
//
//
//        var l = left
//        var r = right
//        let temp = nums[l]
//
//        while l < r {
//            // 右侧找出小于等于标志位的数值
//            while l < r && nums[r] >= temp {
//                r -= 1
//            }
//
//            while l < r && nums[l] <= temp {
//                l += 1
//            }
//
//            if l < r {
//                (nums[l], nums[r]) = (nums[r], nums[l])
//            }
//        }
//
//         nums[left] = nums[l]
//        nums[l] = temp
//
//        quickSort(&nums, left, l-1)
//        quickSort(&nums, l + 1, right)
//
//    }
    
}
