//
//  _253_会议室II.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/28.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension HF {
    /*
      给定一系列会议的开始时间和结束时间。查看最少需要开多少间会议室。
     */
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        guard intervals.count > 0 else {
            return 0
        }
        
        var temIntervals = intervals
        // 按照会议的开始时间从小到大排序
        temIntervals.sort { (m1, m2) -> Bool in
            return m1[0] - m2[0] < 0
        }
        
        // 创建一个最小堆
        var heap = [Int]()
        heap.append(temIntervals[0][1])
        
        var i = 1
        while i < temIntervals.count {
            
            if temIntervals[i][1] >= heap[0] {
                // i 号会议的开始时间大于等于堆顶。堆顶是目前占用会议室中最早结束时间
                heap[0] = temIntervals[i][1]
                siftDowm(&heap, 0, heap.count)
            }else {
                //
                heap.append(temIntervals[i][1])
                // 调整堆 从非叶子节点开始调整
                var j = heap.count/2 - 1
                while j >= 0 {
                    siftDowm(&heap, j, heap.count)
                    j -= 1
                }
                
            }
            
            i += 1
        }
        
        return heap.count
    }
    
    // 小顶堆
    private func siftDowm(_ nums: inout [Int], _ index:Int, _ size:Int) {
        let element = nums[index]
        var i = index
        while i < size/2 {
            // 从第一个非叶子节点进行下虑
            var childIndex = i * 2 + 1
            var child = nums[childIndex]
            
            let rightChildIndex = childIndex + 1
            if rightChildIndex < size && nums[rightChildIndex] < child {
                childIndex = rightChildIndex
                child = nums[rightChildIndex]
            }
            
            guard element > child else {
                // 小顶堆 ，大的值下虑
                break
            }
            
            nums[i] = child
            i = childIndex
        }
        nums[i] = element
    }
    
    
    /*方法2 使用两个数组*/
    func minMeetingRooms2(_ intervals: [[Int]]) -> Int {
        //
        var beginTimes:[Int] = []
        var endTimes:[Int] = []
        
        for item in intervals {
            beginTimes.append(item[0])
            endTimes.append(item[1])
        }
        
        beginTimes.sort(by: <)
        endTimes.sort(by: <)
        
        var room = 0
        var endIndex = 0
        for begin in beginTimes {
            if begin >= endTimes[endIndex] {
                // 能重复利用会议室
                endIndex += 1
            }else{
                // 重新开一个会议室
                room += 1
            }
        }
        
        return room
    }
}
