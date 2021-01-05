//
//  _LC_最长公共前缀.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/1/5.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation


extension LC3{
    /*
     最长公共前缀
     编写一个函数来查找字符串数组中的最长公共前缀。

     如果不存在公共前缀，返回空字符串 ""。

     示例 1:

     输入: ["flower","flow","flight"]
     输出: "fl"
     示例 2:

     输入: ["dog","racecar","car"]
     输出: ""
     解释: 输入不存在公共前缀。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/array-and-string/ceda1/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     方法2：遍历一遍数组中的字符串。最开始取前两个字符串的公共前缀，然后用公共前缀与第三个字符串取公共前缀，依次类推，每次使用公共前缀与后面的字符串取公共前缀
     使用这种办法可以击败98%的人
     */
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else {
            return ""
        }
        func getCommonPref(_ first: String, second: String) -> String {
            var i = min(first.count, second.count) - 1
            while i >= 0 {
                let firstSubStr = first[...first.index(first.startIndex, offsetBy: i)]
                let secondSubStr = second[...second.index(second.startIndex, offsetBy: i)]
                if firstSubStr == secondSubStr {
                    //result & item的公共前缀
                    return String(firstSubStr)
                }
                i -= 1
            }
            return ""
        }
        
        var result = strs.first ?? ""
        
        for i in 1..<strs.count {
            let item = strs[i]
            result = getCommonPref(result, second: item)
        }
        
        return result
    }
    
    /*
    方法一：暴力法
    */
    func longestCommonPrefix1(_ strs: [String]) -> String {
        guard strs.count > 1 else {
            return strs.first ?? ""
        }

        var result = ""
        var i = 0
        let firstStrArr:[Character] = Array(strs.first!)

        while i < firstStrArr.count {
            let currentChar = firstStrArr[i]

            var ended = false

            for j in 1..<strs.count {
                let item = strs[j]
                let itemStrArr:[Character] = Array(item)
                if i < itemStrArr.count {
                    let itemChar = itemStrArr[i]
                    if j == strs.count - 1 && currentChar == itemChar {
                        result.append(itemChar)
                        break
                    }
                    if currentChar == itemChar {
                        continue
                    }else{
                        ended = true
                        break
                    }
                }else{
                    ended = true
                    break
                }
            }

            if ended {
                break
            }

            i += 1
        }
        
        return result
    }
}
