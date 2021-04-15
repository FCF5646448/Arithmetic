//
//  JZ_45把数组排成最小的数.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/3/21.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension JZ {
    /// 45、把数组排成最小的数
    /// 解析： 关键点在于 字符串是可以比较大小的。然后不能拼接成一起比较，怕导致溢出。所以，a + b < b + a 将字符串数组从小到大排列
    func minNumber(_ nums: [Int]) -> String {
        var strArr = [String]()
        for n in nums {
            strArr.append(String(n))
        }
        strArr.sort { (a, b) -> Bool in
            return a + b < b + a
        }
        var result = ""
        for s in strArr {
            result.append(s)
        }
        return result
    }
}
