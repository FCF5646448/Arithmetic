//
//  LC_06_分割回文串.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/11/4.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC {
    /*
     给定一个字符串 s，将 s 分割成一些子串，使每个子串都是回文串。

     返回 s 所有可能的分割方案。

     示例:

     输入: "aab"
     输出:
     [
       ["aa","b"],
       ["a","a","b"]
     ]

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xaxi62/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    // 解析方法，先使用回溯法获取全排序，然后判断是否是回文串，将是回文串的结果添加进数组
    func partition(_ s: String) -> [[String]] {
        var arr: [Character]  = Array(s)
        var result = [[String]]()
        var track: [String] = []
        catSubStr(&arr, 0, &track, &result)
        return result
    }
    
    //回溯过程
    func catSubStr(_ arr: inout [Character], _ index: Int, _ track: inout [String], _ result: inout [[String]]) {
        if arr.count == index {
            result.append(track)
            return
        }
        
        for i in index..<arr.count {
            //剪枝
            if !isPalindrome(arr, index, i) {
                continue
            }
            //加入子串
            track.append(String(arr[index...i]))
            //回溯
            catSubStr(&arr, i + 1, &track, &result)
            //撤销选择
            track.removeLast()
        }
    }
    
    //判断是否回文
    fileprivate func isPalindrome(_ arr: [Character], _ left:Int, _ right:Int) -> Bool {
        var l = left
        var r = right
        while l < r  {
            if arr[l] == arr[r] {
                l += 1
                r -= 1
            }else{
                return false
            }
        }
        
        return true
    }
    
}
