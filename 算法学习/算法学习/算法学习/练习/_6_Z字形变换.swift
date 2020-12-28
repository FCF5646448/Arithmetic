//
//  _6_Z字形变换.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/28.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Practice {
    /*
     将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。

     比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：

     L   C   I   R
     E T O E S I I G
     E   D   H   N
     之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。

     请你实现这个将字符串进行指定行数变换的函数：

     string convert(string s, int numRows);
     示例 1:

     输入: s = "LEETCODEISHIRING", numRows = 3
     输出: "LCIRETOESIIGEDHN"


     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/zigzag-conversion
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func convert(_ s: String, _ numRows: Int) -> String {
        guard s.count > 0 else { return ""}
        let sArr:[Character] = Array(s)

        var line = 0
        var i = 0
        var up = true
        
        var zLine:[Int:[Character]] = [:]
        while line < numRows && i < sArr.count {
            if zLine[line] == nil {
                zLine[line] = [Character]()
            }
            zLine[line]!.append(sArr[i])

            if up {
                line += 1
            }else{
                line -= 1
            }

            if line == numRows {
                up = false
                line = numRows - 2
            }else if line == -1 {
                up = true
                line = 1
            }
            
            // 处理只有一行的情况
            if line < 0 || line >= numRows {
                line = 0
            }
            
            i += 1
        }

        var newStr:[Character] = []
        for line in 0..<numRows {
            let lines:[Character] = zLine[line]!
            for c in lines {
                newStr.append(c)
            }
        }

        print(newStr)
        return String(newStr)
    }
}
