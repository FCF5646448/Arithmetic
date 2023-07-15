//
//  _4_堆排序.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/19.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Sort {
    
    //首先，堆的元素是按层次遍历存储在数组中的，所以大顶堆的话，数组中第0个元素就是堆顶元素，也就是堆里最大的元素。
    //说白了，堆排序，就是将“堆数组”重新进行排序。
    func heapSort0(_ arr:inout [Int]) {
        /*
         * 先原地建堆，也就是先将数组的元素都建堆，然后重新存储到数组中，是数组变成一个“堆数组”。
         * 怎么原地建堆呢？首先我们假设数组现在已经是一个伪堆数组（也就是里面的元素性质还不符合堆的性质），然后我们就依次从第一个非叶子节点进行下虑操作，知道对整个非叶子节点都完成了下虑检测的话，那就是建堆完成。
         */
        //
        var size = arr.count
        var i = size/2 - 1 // 这里为啥是size/2 - 1而不是size/2
        while i >= 0 {
            siftDown0(&arr, i, size)
            i -= 1
        }
        
        
        /*
         * 然后进行排序。
         * 因为大顶堆的话，“堆数组”第一个元素已经是最大值，所以排序就是将堆顶位置与末尾元素进行交换，然后将堆数组的大小减1，说白了就是“堆数组“变成最终有序数组的一部分，然后对那部分堆数组进行同样的操作，直到堆数组只剩一个元素。
         * 堆顶元素与堆尾元素
         */
        while size > 1 {
            //先交换位置
            let temp  = arr[size - 1]
            arr[size - 1] = arr[0]
            arr[0] = temp
            //然后对堆顶元素进行下虑，此时，堆元素的大小就是size - 1。
            size = size - 1
            siftDown0(&arr, 0, size)
            
        }
        
        
    }
    
    /*
     下虑：
     如果node < 子节点，与最大的子节点交换位置；
     如果node >= 子节点或者没有子节点，退出循环
     必须保证index的位置是第一个非叶子节点，也就是 index < size/2
     */
    func siftDown0(_ arr:inout [Int], _ index:Int, _ size:Int ) {
        var i = index
        let element = arr[i]
        while i < size/2 {
            //从第一个非叶子节点位置开始，如果需要下虑就下虑，因为下虑之后，可能会影响到其父节点，所以要使用遍历循环。
            var childIndex = 2 * i + 1
            var child = arr[childIndex]
            
            //比较左右子节点，将childIndex、child作为最大节点来用
            let righitChildIndex = childIndex + 1
            if righitChildIndex < size && arr[righitChildIndex] > child {
                childIndex = righitChildIndex
                child = arr[righitChildIndex]
            }
            
            if element > child {
                //大顶堆 ,如果当前元素大于最大子节点，则无需下虑
                break
            }
            
            //如果当前元素比子节点小，就交换
            arr[i] = child
            i = childIndex
        }
        
        arr[i] = element
    }
}
