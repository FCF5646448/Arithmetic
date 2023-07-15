import UIKit
import CoreGraphics

var greeting = "Hello, playground"

/// 26 删除有序数组中的重复项
func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var slow = 0
    var fast = 1
    while fast < nums.count {
        if nums[slow] == nums[fast] {
            fast += 1
        } else {
            slow += 1
            if slow != fast {
                (nums[slow], nums[fast]) = (nums[fast], nums[slow])
            }
            fast += 1
        }
    }
    return slow + 1
}

/// 27. 移除指定元素，返回新的长度
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var slow = 0
    var fast = 0
    while fast < nums.count {
        if nums[fast] != val {
            nums[slow] = nums[fast]
            slow += 1
        }
        fast += 1
    }
    
//    while fast < nums.count {
//        fast += 1
//        if nums[slow] == val {
//            if fast < nums.count && nums[fast] != val {
//                (nums[slow], nums[fast]) = (nums[fast], nums[slow])
//                slow += 1
//            }
//        } else {
//            slow += 1
//        }
//    }
    return slow
 }

/// 283.移动零
func moveZeroes(_ nums: inout [Int]) {
    guard nums.count > 0 else {
        return
    }
    var slow = 0
    var fast = 0
    while fast < nums.count {
        if nums[fast] != 0 {
            (nums[slow], nums[fast]) = (nums[fast],nums[slow])
            slow += 1
        }
        fast += 1
    }
}

///  167.两数之和|| 输入有序数组
func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    guard numbers.count > 0 else {
        return []
    }
    var left = 0
    var right = numbers.count - 1
    while left < right {
        let sum = numbers[left] + numbers[right]
        if sum == target {
            return [left + 1, right + 1]
        } else if sum < target {
            left += 1
        } else if sum > target {
            right -= 1
        }
    }
    return []
}

/// 344.反转字符串
func reverseString(_ s: inout [Character]) {
    guard s.count > 0 else {
        return
    }
    var left = 0
    var right = s.count - 1
    while left < right {
        (s[left], s[right]) = (s[right], s[left])
        left += 1
        right -= 1
    }
}

/// 5.最长回文子串(策略不行，会超出时间)
func longestPalindrome(_ s: String) -> String {
    func checkIsPalindrome(_ sArr: [Character]) -> Bool {
        guard sArr.count > 0 else {
            return false
        }
        var left = 0
        var right = sArr.count - 1
        while left < right {
            if sArr[left] != sArr[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
    
    let sArr = Array(s)
    var resultArr = [Character]()
    var left = 0
    var right = sArr.count - 1
    while left <= right {
        let subArr = Array(sArr[left...right])
        debugPrint("left:\(left), right:\(right) subArr:\(String(subArr))")
        if subArr.count <= resultArr.count {
            left += 1
            right = sArr.count - 1
            continue
        }
        if checkIsPalindrome(subArr) {
            resultArr = subArr
            left += 1
            right = sArr.count - 1
            continue
        }
        right -= 1
        if left > right {
            left += 1
            right = sArr.count - 1
        }
    }
    debugPrint(String(resultArr))
    return String(resultArr)
}

_ = longestPalindrome("a")


/// 5.最长回文子串2(双指针技巧)
func longestPalindrome2(_ s: String) -> String {
    // 在s中寻找以s[l]和s[r]为中心的最长回文串，
    func palindrome(_ sArr: [Character], l: Int, r: Int) -> String {
        var l = l
        var r = r
        while l >= 0 && r < sArr.count && sArr[l] == sArr[r] {
            l -= 1
            r += 1
        }
        // 注意这个取值范围
        let subString = String(sArr[l+1..<r])
        debugPrint(subString)
        return subString
    }
    
    var res = ""
    let sArr = Array(s)
    for i in 0..<sArr.count {
        let s1 = palindrome(sArr, l: i, r: i)
        let s2 = palindrome(sArr, l: i, r: i+1)
        res = res.count > s1.count ? res: s1
        res = res.count > s2.count ? res: s2
    }
    debugPrint(res)
    return res
}







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
