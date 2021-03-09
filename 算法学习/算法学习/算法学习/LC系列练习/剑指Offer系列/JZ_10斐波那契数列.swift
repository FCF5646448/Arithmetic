//
//  JZ_10斐波那契数列.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/3/3.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension JZ {
    /// 求斐波那契数列的第n项
    static var stroge = [Int:Int]()
    func fib2(_ n: Int) -> Int {
        if n <= 1 {
            JZ.stroge[n] = n
            return n
        }
        if JZ.stroge[n] != nil {
            return JZ.stroge[n]!
        }
        let result = fib(n - 2) + fib(n - 1)
        JZ.stroge[n] = result
        return result
    }
    
    func fib(_ n: Int) -> Int {
        guard n >= 0 else {
            return 0
        }
        if n <= 1 {
            return n
        }
        
        var fib0 = 1
        var fib1 = 0
        var fibN = 0
        for _ in 2..<(n+1) {
            fibN = fib0 + fib1
            fib1 = fib0
            fib0 = fibN
        }
        return fibN
    }
}
