//
//  _46_全排列.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/12.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

class Permutation {
    
    /*
     回溯算法
     result = []
     def backtrack(路径, 选择列表):
         if 满足结束条件:
             result.add(路径)
             return
         for 选择 in 选择列表:
             做选择
             backtrack(路径, 选择列表)
             撤销选择
     
     */
    
    /*
     回溯法解决：
     给定一个 没有重复 数字的序列，返回其所有可能的全排列。
     
     1,2,3
     1,3,2
     2,1,3
     2,3,1
     3,1,2
     3,2,1
     
     */
    
    var nums:[Int] = []
    //用来存储第i个下标的值，mute[0] = 1 第0个下标是1
    var mutes:[Int]!
    var result = [[Int]]()
    var way = 0
    
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else {
            return []
        }
        
        self.nums = nums
        mutes = Array(repeating: 0, count: nums.count)
        
        permuteIndex(0)
        
        return result
    }
    
    //整理第0个
    func permuteIndex(_ index:Int) {
        if index == mutes.count {
            //完成1中组合
            way += 1
            show()
            return
        }
        for n in nums {
            if isValied(index,n) {
                mutes[index] = n
                permuteIndex(index + 1)
            }
        }
    }
    
    //判断第index个字符是否可以是n
    func isValied(_ index:Int,_ n:Int) -> Bool {
        for i in 0..<index {
            if mutes[i] == n {
                return false
            }
        }
        return true
    }
    
    //打印出来
    func show() {
        print(mutes as Any)
        result.append(mutes)
    }
    
    
}
