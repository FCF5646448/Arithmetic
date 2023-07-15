//
//  LC_有效的字母异位词.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/11/19.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC {
    /*
     给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

     示例 1:

     输入: s = "anagram", t = "nagaram"
     输出: true
     示例 2:

     输入: s = "rat", t = "car"
     输出: false
     说明:
     你可以假设字符串只包含小写字母。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xar9lv/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let sArr: [Character] = Array(s)
        let tArr: [Character] = Array(t)
        var hashMap = [Character:Int]() //存放每个字符出现的次数
        for c in sArr {
            if hashMap[c] != nil {
                hashMap[c]! += 1
            }else{
                hashMap[c] = 1
            }
        }

        for c in tArr {
            if hashMap[c] == nil {
                return false
            }else{
                hashMap[c]! -= 1
            }
        }

        for (_,value) in hashMap {
            if value != 0 {
                return false
            }
        }
        return true
    }
}
