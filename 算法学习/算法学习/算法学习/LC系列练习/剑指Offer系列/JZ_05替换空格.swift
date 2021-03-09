//
//  JZ_05替换空格.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/2/21.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension JZ {
    /*
     请实现一个函数，把字符串中的每个空格替换成%20，例如输入"We are happy."，则输出"We%20are%20happy."
     注意：在原来的字符串的基础上替换。假设原有字符串足够长
     */
    
    /*
     解析：
     需要考虑原有字符串移动的问题。因为每替换一个字符，字符串的长度是需要加2的。
     所以凡是这种替换的题目，都应该从后往前。
     
     举一反三：合并两个有序数组。
     */
    
    func replaceSpace(_ s: String) -> String {
        let sArr = Array(s)
        var newSArr = sArr
        for c in s {
            if c == " " {
                newSArr.append(" ")
                newSArr.append(" ")
            }
        }
        
        var i = sArr.count - 1
        var j = newSArr.count - 1
        while i != j  {
            if sArr[i] == " " {
                newSArr[j] = "0"
                newSArr[j - 1] = "2"
                newSArr[j - 2] = "%"
                j -= 3
            }else{
                newSArr[j] = sArr[i]
                j -= 1
            }
            i -= 1
        }
        
        let result = String(newSArr)
        return result
    }
    
    
}
