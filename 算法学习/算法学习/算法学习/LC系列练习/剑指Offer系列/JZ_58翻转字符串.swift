//
//  JZ_58翻转字符串.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/4/15.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension JZ {
    func reverseWords(_ s: String) -> String {
        func reverseWorld(_ sArr: inout [Character], _ begin:Int, _ end:Int) {
            var l = begin
            var r = end
            while l < r {
                (sArr[l], sArr[r]) = (sArr[r], sArr[l])
                l += 1
                r -= 1
            }
        }

        guard s.count > 0 else{
            return ""
        }
        var result = Array(s)
        while result.first != nil && result.first! == " " {
            result.removeFirst()
        }
        while result.last != nil && result.last! == " " {
            result.removeLast()
        }

        reverseWorld(&result, 0, result.count - 1)
        print(result)
        var begin = 0
        var resultStr = ""
        var end = begin
        while end<result.count {
            if end == result.count - 1 || result[end + 1] == " " {
                reverseWorld(&result, begin, end)

                if resultStr != "" {
                    resultStr += " "
                }
                var tempArr = [Character]()
                for i in begin..<(end + 1) {
                    tempArr.append(result[i])
                }
                resultStr += String(tempArr)
                var newbegin = end + 1
                while newbegin < result.count && result[newbegin] == " " {
                    newbegin += 1
                }
                begin = newbegin
                end = begin
            }else{
                end += 1
            }
        }

        return resultStr

    }
}
