//
//  _62_约瑟夫环_圆圈中最后剩下数字.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/16.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

class ArrayList {
    /*
     0,1,,n-1这n个数字排成一个圆圈，从数字0开始，每次从这个圆圈里删除第m个数字。求出这个圆圈里剩下的最后一个数字。

     例如，0、1、2、3、4这5个数字组成一个圆圈，从数字0开始每次删除第3个数字，则删除的前4个数字依次是2、0、4、1，因此最后剩下的数字是3。
     
     长度为n时，删除第 m%n 个节点 ，长度为 n-1 时，删除 m%(n-1) 个节点。
     
     m % (n - x)
     
     */
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        var f = 0
        var i = 2
        while i != n + 1 {
            f = (m + f) % i
            i += 1
        }
        return f
    }
    
    //递归
    func lastRemaining2(_ n: Int, _ m: Int) -> Int {
        func f(_ n: Int, _ m: Int) -> Int {
            if n == 1 {
                return 0
            }
            let x = f(n-1, m)
            return (m + x) % n
        }
        return f(n,m)
    }
    
    //详解
    // https://cloud.tencent.com/developer/article/1164728
    
}
