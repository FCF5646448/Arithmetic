//: Playground - noun: a place where people can play

import UIKit
import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var tempDic:[Int:Int] = [:]
        for (index,num) in nums.enumerated() { //enumerated()这是个函数
            if let otherIndex = tempDic[(target - num)] {
                return [index,otherIndex];
            }
            tempDic[num] = index
        }
        fatalError("no valid output")
    }
}

Solution().twoSum([3,3,6], 9) //按理，这里应该输出【2，0】




