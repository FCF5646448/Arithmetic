//
//  _剑指62_圆圈中最后剩下的数字.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/27.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension HF {
    
    /*
     剑指 Offer 62. 圆圈中最后剩下的数字
     0,1,,n-1这n个数字排成一个圆圈，从数字0开始，每次从这个圆圈里删除第m个数字。求出这个圆圈里剩下的最后一个数字。

     例如，0、1、2、3、4这5个数字组成一个圆圈，从数字0开始每次删除第3个数字，则删除的前4个数字依次是2、0、4、1，因此最后剩下的数字是3。

      

     示例 1：

     输入: n = 5, m = 3
     输出: 3
     示例 2：

     输入: n = 10, m = 17
     输出: 2

     */
    
    /*
     递推公式 f(n,m) = (f(n - 1, m) + m) % n
     */
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        if n == 1 {
            return 0
        }
        return (lastRemaining(n - 1, m) + m) % n
    }
    
    
    func lastRemaining2(_ n: Int, _ m: Int) -> Int {
        var res = 0
        // i代表有多少个人
        for i in 2..<n {
            res = (res + m) % i
        }
        return res
    }
}
