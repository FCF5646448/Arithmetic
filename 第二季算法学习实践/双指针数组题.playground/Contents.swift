import UIKit

var greeting = "Hello, playground"


/// 寻找两个正序数组的中位数
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    // 维护一个优先级队列
    func enqueue(_ priorityArray: inout [Int], n: Int) {
        for (index, oldNum) in priorityArray.enumerated() {
            if n < oldNum {
                priorityArray.insert(index, at: n)
                return
            }
        }
        priorityArray.append(n)
        print("priorityArray :\(priorityArray)")
    }
    
    let allCount = nums1.count + nums2.count
    guard allCount > 0 else {
        return 0
    }
    var priorityArray = [Int]()
    let midIndex = allCount/2
    var p1 = 0
    var p2 = 0
    while p1 < nums1.count || p2 < nums2.count {
        // 小的先入队
        if p1 < nums1.count && p2 < nums2.count {
            if nums1[p1] <= nums2[p2] {
                enqueue(&priorityArray, n: nums1[p1])
                p1 += 1
            } else {
                enqueue(&priorityArray, n: nums2[p2])
                p2 += 1
            }
        } else if p1 < nums1.count {
            enqueue(&priorityArray, n: nums1[p1])
            p1 += 1
        } else if p2 < nums2.count {
            enqueue(&priorityArray, n: nums2[p2])
            p2 += 1
        }
        if priorityArray.count > midIndex {
            break
        }
    }
    
    if allCount % 2 == 0 {
        // 偶数
        let preMid = midIndex - 1
        let preValue = priorityArray[preMid]
        let midValue = priorityArray[midIndex]
        print("偶数--- (midIndex:\(midIndex), value:\(midValue); (preMid:\(preMid), value:\(preValue)")
        return Double(preValue + midValue) / 2.0
    } else {
        // 奇数
        let midValue = priorityArray[midIndex]
        print("奇数---(index:\(midIndex), value:\(midValue))")
        return Double(midValue)
    }
}
