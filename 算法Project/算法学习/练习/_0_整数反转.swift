//
//  _0_整数反转.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/25.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Solution {
    /*
     负数仍为负数
     012显示12
     不能操作Int32的范围
     */
    func reverse(_ x: Int) -> Int {
        if x == 0 {
            return 0
        }
        let str = String(format:"%d",x)
        print(str)
        var s:[Character] = Array(str)
        print(s)
        var left = 0
        if let n = s.first, n == "-" {
            left += 1
        }
        
        if let n = s.last, n == "0" {
            s.removeLast()
        }
        var right = s.count - 1
        
        while left < right {
            (s[left],s[right]) = (s[right],s[left])
            left += 1
            right -= 1
        }
        
        let newStr = String(s)
        let result = Int(newStr)!
        
        if result > Int32.max || result < Int32.min {
            return 0
        }
        return result
    }

}
