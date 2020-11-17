//
//  LC_07_单词拆分.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/11/5.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC {
    /*
     给定一个非空字符串 s 和一个包含非空单词的列表 wordDict，判定 s 是否可以被空格拆分为一个或多个在字典中出现的单词。

     说明：

     拆分时可以重复使用字典中的单词。
     你可以假设字典中没有重复的单词。
     示例 1：

     输入: s = "leetcode", wordDict = ["leet", "code"]
     输出: true
     解释: 返回 true 因为 "leetcode" 可以被拆分成 "leet code"。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xa503c/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     方法一：动态规划
     1、初始化一个数组dp = [false,false,...false]，长度为 n+1. n为字符串长度。它用来存储字符串的前i位是否可以用字典里的单词表示；
     2、初始化dp[0] = true, 表示空字符串可以被表示。 这一步很重要，否则遍历条件就不好判断
     3、遍历字符串的所有子串，遍历开始索引i,
        3.1 遍历结束索引j，遍历区间[i+1,n+1)
            若dp[i] == true 且 s[i, j)在wordDic中，则dp[j] = true。因为dp[i] == true,说明s的前i位可以用wordDict表示，则s[i，j)已经在Dict中，所以前j位都可以表示。
     */
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let strArr: [Character] = Array(s)
        var dp = Array(repeating: false, count: strArr.count + 1)
        dp[0] = true // 空字符串表示可以
        for i in 0..<strArr.count {
            for j in i + 1 ..< strArr.count + 1 {
                let subStr = String(strArr[i..<j])
                if dp[i] == true && wordDict.contains(subStr) {
                    dp[j] = true
                }
            }
        }
        
        return dp[strArr.count]
    }
    
    /*
     方法二：DFS回溯算法, 但是超时了。
     */
    func wordBreak2(_ s: String, _ wordDict: [String]) -> Bool {
        //判断从start到末尾的子串能否break
        func canBreak(_ s: String, _ wordSet: Set<String> , _ start: Int, _ length: Int) -> Bool {
            if start == length {
                //字符串
                return true
            }
            
            for i in start+1 ..< length+1 {
                
                let preSubStr = String(s[s.index(s.startIndex, offsetBy: start)..<s.index(s.startIndex, offsetBy: i)])
                //判断(start ... i)字符串是否在字典中，如果在就接着判断（i...length）。
                if wordSet.contains(preSubStr) && canBreak(s, wordSet, i, length) {
                    //如果前缀是单词，且剩余部分可以break，则是单词
                    return true
                }
            }
            
            return false
        }
        
        let length = s.count
        let wordSet = Set(wordDict)
        
        return canBreak(s, wordSet, 0, length)
        
    }
    
    /*
     方法二优化 ：DFS回溯算法 + 缓存。
     */
    func wordBreak3(_ s: String, _ wordDict: [String]) -> Bool {
        //判断从start到末尾的子串能否break
        func canBreak(_ s: String, _ wordSet: Set<String> , _ arr: inout [Int], _ start: Int, _ length: Int) -> Bool {
            if start == length {
                //字符串
                return true
            }
            if arr[start] != -1 {
                if arr[start] == 0 {
                    return false
                }else{
                    return true
                }
            }
            
            for i in start+1 ..< length+1 {
                //(start ... i)
                let preSubStr = String(s[s.index(s.startIndex, offsetBy: start)..<s.index(s.startIndex, offsetBy: i)])
                //判断(start ... i)字符串是否在字典中，如果在就接着判断（i...length）。
                if wordSet.contains(preSubStr) && canBreak(s, wordSet, &arr, i, length) {
                    //如果前缀是单词，且剩余部分可以break，则是单词
                    arr[start] = 1
                    return true
                }
            }
            arr[start] = 0
            return false
        }
        
        let length = s.count
        let wordSet = Set(wordDict)
        //memArr 用来存储从0到i的子串是否在字典中
        var memArr = Array(repeating: -1, count: length)
        
        return canBreak(s, wordSet , &memArr , 0, length)
        
    }
    
//    
//    /*
//     练习 方法二优化 ：DFS回溯算法 + 缓存。
//     */
//    func wordBreak4(_ s: String, _ wordDict: [String]) -> Bool {
//        var cache = Array(repeating: -1, count: s.count) //存储当前下标之前的s是否能被拆分
//        return canbreak2(s, wordDict, &cache, 0, s.count)
//    }
//    
//    func canbreak2(_ s: String,_ wordDict: [String], _ arr: inout Array<Int>, _ start:Int, _ length: Int)->Bool {
//        if start == length {
//            return true
//        }
//        if arr[start] != -1 {
//            if arr[start] == 1 {
//                return true
//            }else{
//                return false
//            }
//        }
//        
//        for i in start + 1 ..< length + 1 {
//            // 从i分割子串
//            let preSubStr = String(s[s.index(s.startIndex, offsetBy: start) ... s.index(s.startIndex, offsetBy: i)])
//            if wordDict.contains(preSubStr) && canbreak2(s, wordDict, &arr, i, length) {
//                arr[start] = 1
//                return true
//            }
//        }
//        arr[start] = 0
//        return false
//    }
    
}
