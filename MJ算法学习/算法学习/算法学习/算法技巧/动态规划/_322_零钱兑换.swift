//
//  _322_零钱兑换.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/15.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation
class DynamicPrograming {
    /*
     给定不同面额的硬币 coins 和一个总金额 amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/coin-change
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    
    //注意，这种没法处理不可兑换的问题
    func coinChange3(_ coins: [Int], _ amount: Int) -> Int {
        if amount < 1 {
            return 0
        }
        
        var dp = Array(repeating: 0, count: amount + 1)
        var newCoin = coins
        newCoin.sort(by: >)
        
        let minCoin = newCoin.last!
        for i in minCoin..<(amount + 1) {
            var minCount = dp[i - 1]
            for j in newCoin {
                if i >= j {
                    minCount = min(dp[i - j], minCount)
                }
            }
            dp[i] = minCount + 1
        }
        return dp[amount] == Int.max ? -1 : dp[amount]
    }
    
    //
    func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
        if amount < 1 {
            return 0
        }
        
        var dp = Array(repeating: 0, count: amount + 1)
        var newCoin = [Int]()
        for n in coins {
            if amount < n { continue }
            dp[n] = 1
            newCoin.append(n)
        }
        newCoin.sort(by: >)
        
        let result = coinChange2(amount,newCoin,&dp)
        return  result == Int.max ? -1 : result
    }
    
    
    func coinChange2(_ n:Int,_ coins:[Int], _ dp:inout [Int]) -> Int {
        if n < 1 { return Int.max }
        if dp[n] == 0 {
            var minCount = Int.max
            for coin in coins {
                minCount = min(coinChange2(n-coin,coins,&dp), minCount)
            }
            if minCount == Int.max {
                //
                dp[n] = Int.max
            }else{
                dp[n] = minCount + 1
            }
        }
        return dp[n]
    }
    
    
    
    
    /*
    动态规划：暴力递归
    */
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount < 1 {
            return 0
        }
        let result = coinChange(amount,coins.reversed())
        return  result == Int.max ? -1 : result
    }
    
    func coinChange(_ n:Int,_ coins:[Int]) -> Int {
        if n < 1 {
            return Int.max
        }
        if coins.contains(n)  {
            return 1
        }
        
        var minCount = Int.max
        for coin in coins {
            minCount = min(coinChange(n-coin,coins), minCount)
        }
        if minCount == Int.max {
            //
            return Int.max
        }
        return minCount + 1
    }
    
}
