//
//  _LC_最长回文子串.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/1/5.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation


extension LC3{
    /*
     给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

     示例 1：

     输入: "babad"
     输出: "bab"
     注意: "aba" 也是一个有效答案。
     示例 2：

     输入: "cbbd"
     输出: "bb"

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/array-and-string/conm7/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    // TODO 
    func longestPalindrome(_ s: String) -> String {
        return ""
    }
    
    /*
     暴力解法
     从第i个字符判断。取最大的回文串
     方法会超时
     */
    func longestPalindrome1(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        // 判断是否是回文串
        func isVaildPaindrome(_ s:String) -> Bool {
            guard s.count > 1 else {
                return true
            }
            var i = 0
            var j = s.count - 1
            while i < j {
                let lc = String(s[s.index(s.startIndex,offsetBy: i)..<s.index(s.startIndex,offsetBy: i+1)])
                let rc = String(s[s.index(s.startIndex,offsetBy: j)..<s.index(s.startIndex,offsetBy: j+1)])
                if lc != rc {
                    return false
                }
                i += 1
                j -= 1
            }
            return true
        }

        
        var begin = 0
        var length = 0
        // 左闭右开区间
        for i in 0..<s.count {
            for j in i+1...s.count{
                let subStr = String(s[s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: j)])
                if isVaildPaindrome(subStr) {
                    if length < j - i {
                        begin = i
                        length = j - i
                    }
                }
            }
        }
        
        return String(s[s.index(s.startIndex, offsetBy: begin)..<s.index(s.startIndex, offsetBy: begin + length)])
    }
    
    
}
