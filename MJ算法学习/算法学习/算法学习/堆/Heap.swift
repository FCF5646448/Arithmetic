//
//  Heap.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/19.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

class Heap {
    
    // 使用数组建堆
    
    
    //批量建堆
    
    /*
     从第一个非叶子节点开始下虑
     */
    func siftDown(_ arr: inout [Int], _ index:Int, _ size:Int) {
        
        var i = index
        //将要执行下率的节点
        let element = arr[i]
        //第一个叶子节点的索引  == 非叶子节点的数量 == size/2
        let half = size/2
        //必须保证index位置是非叶子节点
        while i < half {
            //index 节点有两种情况 1、只有左子节点；2、y同时有左右子节点
            //默认为左子节点的索引
            var childIndex = i * 2 + 1
            //找到左子节点
            var child = arr[childIndex]
            
            // 取最大子节点
            // 先取出右子节点的索引
            let rightIndex = childIndex + 1
            //选出左右子节点最大的那个节点
            if rightIndex < size && arr[rightIndex] > child {
                //取右边节点
                childIndex = rightIndex
                child = arr[rightIndex]
            }
            
            
            if element >= child {
                //将要进行下虑的节点大于子节点，则不进行下虑
                break
            }
            
            //否则将子节点存到index的位置，然后index指向childIndex的位置
            arr[i] = child
            i = childIndex
        }
        
        arr[i] = element
    }
    
    
    /*
     用n替换堆顶元素，然后调整堆（下虑）
     */
    func replace(_ arr:inout [Int],_ n:Int) {
        if arr.count == 0 {
            arr += [n]
        }else{
            arr[0] = n
            siftDown(&arr, 0, arr.count)
        }
    }
    
    
}
