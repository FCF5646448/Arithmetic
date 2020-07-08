//
//  _0_爬楼梯问题.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/7.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

class Recursion {
    /*
     有n阶楼梯，每一次爬楼梯都只能爬1阶或者2阶。
     求爬到第n阶楼梯有多少种方法。
     
     分析：
     首先按递归的思路分析一下，这个问题其实是可以分解成子问题的。
     因为每次只能爬1阶或两阶，所以爬到第n阶楼梯的方法只能是在n-1阶中爬了一阶后达到，或者在n-2阶中爬了2阶到达。
     所以爬到第n阶的方法就是爬到n-1阶的方法或者爬到n-2阶的方法之和。
     
     然后考虑一下最小规模问题，因为得从最小规模推导到最大规模。最小情况就是n==1时，那么就只有1种方法：爬1阶；如果n==2时，那么就有2种方案：一次爬2阶或者2次爬1阶; n==3时，就是f(1) + f(2)。所以最小情况就是n==1或n==2的情况
     */
    func climbStairs(_ n:Int) -> Int {
        if n <= 2 {
            return n
        }
        return climbStairs(n - 1) + climbStairs(n - 2)
    }
    
    
    //对算法进行优化，因为每一次计算f(n-1)和f(n-2)的时候，都会有大量的重复计算。所以可以使用一个数组对已计算的结果进行缓存
    var map = [Int:Int]()
    func climbStairs1(_ n: Int) -> Int {
        if map.keys.contains(n) {
            return map[n]!
        }
        
        if n <= 2 {
            map[n] = n
            return n
        }
        
        let result = climbStairs1(n - 1) + climbStairs1(n - 2)
        map[n] = result
        return result
    }
    
    //优化2，其实我们发现，每一次都是只需要取最近的两位数
    func climbStairs2(_ n: Int) -> Int {
        if n <= 2 {
            map[n] = n
            return n
        }
        
        var first = 1
        var second = 2
        
        for _ in 3..<(n + 1) {
            second = first + second
            first = second - first
        }
        return second
    }
    
    
}


