//
//  _LC3_两数之和II.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/15.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC3 {
    /*
     两数之和 II - 输入有序数组
     给定一个已按照升序排列 的有序数组，找到两个数使得它们相加之和等于目标数。

     函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2。

     说明:

     返回的下标值（index1 和 index2）不是从零开始的。
     你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素。
     示例:

     输入: numbers = [2, 7, 11, 15], target = 9
     输出: [1,2]
     解释: 2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/all-about-array/x9i1x6/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     题解分析
     这道题与两数之和I不一样，因为这里可能存在重复的元素，所以不能直接用字典来存每一个下标
     */
    
    /*
     方法一：
     暴力法：使用双重循环来查找
     */
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var i = 0
        while i < numbers.count {
            let first = numbers[i]
            var j = numbers.count - 1
            while j > i {
                if target - first == numbers[j] {
                    return [i+1, j+1]
                }
                j -= 1
            }
            i += 1
        }
        return []
    }
    
    /*
     方法二：对撞指针法
     使用两个指针从两端开始查找。
     如果 target > numbers[i] + numbers[j], 则 i + 1
     如果 target < numbers[i] + numbers[j], 则 j - 1
     */
    
    func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
        var i = 0
        var j = numbers.count - 1
        while i < j {
            if target > numbers[i] + numbers[j] {
                i += 1
            }else if target < numbers[i] + numbers[j] {
                j -= 1
            }else{
                return [i+1, j+1]
            }
        }
        return []
    }
}
