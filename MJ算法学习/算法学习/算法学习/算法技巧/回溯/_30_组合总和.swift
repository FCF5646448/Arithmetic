//
//  _30_组合总和.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/12.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


class Combination {
    /*
     给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。

     candidates 中的数字可以无限制重复被选取。

     说明：

     所有数字（包括 target）都是正整数。
     解集不能包含重复的组合。
     示例 1:

     输入: candidates = [2,3,6,7], target = 7,
     所求解集为:
     [
       [7],
       [2,2,3]
     ]
     示例 2:

     输入: candidates = [2,3,5], target = 8,
     所求解集为:
     [
       [2,2,2,2],
       [2,3,3],
       [3,5]
     ]

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/combination-sum
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    var candidates:[Int] = []
    var target = 0
//    表示第i个元素存储的值
    var cols = [Int]()
    var sumOfCombinations = 0
    var result = [[Int]]()
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard candidates.count > 0 else{
            return []
        }
        self.candidates = candidates
        self.target = target
        
        combination(0)
        
        return result
    }
    
    //查找第index元素
    func combination(_ index:Int) {
    
        if sumOfCombinations > self.target {
            return
        }
        
        if sumOfCombinations == self.target {
            show()
            return
        }
        
        for col in 0..<candidates.count {
            //这里要进行剪枝，如果当前遍历到的值小于组合中最后一个值，就不入队，去除重复组合（默认数组是从小到大排列的）
            if candidates[col] >= (cols.last ?? 0) {
                cols.append(candidates[col])
                sumOfCombinations += candidates[col]
                
                combination(index + 1)
                
                //回溯
                sumOfCombinations -= candidates[col]
                cols.removeLast()
            }
        }
    }
    
    func show(){
        print(cols)
        result.append(cols)
    }

    
}
