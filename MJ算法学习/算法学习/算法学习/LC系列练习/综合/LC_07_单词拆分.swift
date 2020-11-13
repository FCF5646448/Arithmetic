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
    // 从例子中可以看出 使用过的 单词就得从 字符串中移除，字典中出现过的词可以重复出现，但是满足true的条件是字典中所有的单词必须被包含进字符串中
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        
        
        xxxxxxxxx
        
        
        if wordDict.count > 0 {
            //
            var subStr = s
            var subDict = wordDict
            if let first = wordDict.first, subStr.contains(first) {
                subString(&subStr, first)
                subDict.remove(at: 0)
                return wordBreak(subStr, subDict)
            }else{
                return false
            }
        }else if s.count > 0 {
            //字典为空，s不为空
            return true
        }else{
            //
            return true
        }
    }
    
    // 移除子串
    func subString(_ originStr: inout String, _ target: String) {
        guard let range = originStr.range(of: target) else {
            return
        }
        originStr.removeSubrange(range)
    }
    
}
