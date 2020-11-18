//
//  LC_08_单词拆分II.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/11/17.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC {
    /*
     给定一个非空字符串 s 和一个包含非空单词列表的字典 wordDict，在字符串中增加空格来构建一个句子，使得句子中所有的单词都在词典中。返回所有这些可能的句子。

     说明：

     分隔时可以重复使用字典中的单词。
     你可以假设字典中没有重复的单词。
     示例 1：

     输入:
     s = "catsanddog"
     wordDict = ["cat", "cats", "and", "sand", "dog"]
     输出:
     [
       "cats and dog",
       "cat sand dog"
     ]
     示例 2：

     输入:
     s = "pineapplepenapple"
     wordDict = ["apple", "pen", "applepen", "pine", "pineapple"]
     输出:
     [
       "pine apple pen apple",
       "pineapple pen apple",
       "pine applepen apple"
     ]
     解释: 注意你可以重复使用字典中的单词。
     示例 3：

     输入:
     s = "catsandog"
     wordDict = ["cats", "dog", "sand", "and", "cat"]
     输出:
     []

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xa9v8i/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     同样的，使用回溯算法，先判断是否可以拆分，再可以拆分的前提下组成成句子。
     但是使用会超时。
     */
    func wordBreakII(_ s: String, _ wordDict: [String]) -> [String] {
        var tempArr: [String] = []  //用来存储每个被拆分出来的子串
        var result: [String] = []   //存储每一次的迭代结果
        
        canBreak3(s, wordDict, &tempArr, &result, 0, s.count)
        
        return result
    }
    
    fileprivate func canBreak3(_ s: String, _ wordDict: [String], _ arr: inout [String],_  result: inout [String], _ start: Int, _ length: Int) {

        if start == length {
            //结束，那说明所有的子串都可以找到匹配。将arr里的东西装入result中。
            var resultStr = ""
            for str in arr {
                resultStr.append("\(str) ")
            }
            resultStr.removeLast() //移除最后的空格
            print(resultStr)
            result.append(resultStr)
            return
        }
        
        
        for i in start + 1 ..< length + 1 {
            //左闭右开的区间
            let preStr = String(s[s.index(s.startIndex, offsetBy: start) ..< s.index(s.startIndex, offsetBy: i)])
            
            if !wordDict.contains(preStr) {
                continue
            }
            
            //可以拆分，将单词添加进数
            arr.append(preStr)
            //遍历剩余子串
            canBreak3(s, wordDict, &arr, &result, i, length)
            //回溯删除
            arr.removeLast()
        }
        
    }
    
    /*
     注意字典的设定
     优化+缓存
     缓存某一子串对应的所有切割结果集合
     */
    func wordBreakII2(_ s: String, _ wordDict: [String]) -> [String] {
        var allWordStr = [String:[String]]()   //表示某一子串所对应的所有子串切割集合
        
        let result = canBreak4(wordDict, &allWordStr, s)
        print(result)
        return result
    }
    
    fileprivate func canBreak4(_ wordDict: [String], _  allWordStr: inout [String:[String]], _ s: String) -> [String] {
        if allWordStr[s] != nil {
            return allWordStr[s]!
        }
        if s == "" {
            return [""]
        }
        var res = [String]()
        // 反过来做，使用字典的词，回溯拼凑字符串
        for word in wordDict {
            let len = word.count
            if word.count > s.count {
                continue
            }
            //找到前面字符串
            let subStr = String(s[s.index(s.startIndex, offsetBy: 0) ..< s.index(s.startIndex, offsetBy: len)])
            if subStr != word {
                continue
            }
            
            //剩余子串接着查找
            let newStr = String(s[s.index(s.startIndex, offsetBy: len) ..< s.index(s.startIndex, offsetBy: s.count)])
            
            // 字符串newStr所对应的所有子串切割集合
            let tempArr = canBreak4(wordDict, &allWordStr, newStr)
            for item in tempArr {
                res.append("\(word)\(item == "" ? "" : " "+item)")
            }
        }
        
        allWordStr[s] = res
        return res
    }
    
    
}
