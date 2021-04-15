//
//  JZ_13机器人的运动范围.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/4/14.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension JZ {
    /*
     地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？

     作者：画手大鹏
     链接：https://leetcode-cn.com/leetbook/read/illustrate-lcof/eoci8c/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        guard m * n > 0 else{
            return 0
        }
        guard k > 0 else {
            return 1
        }
        var visited = Array(repeating: false , count: m * n)
        return movingCount(visited:  &visited, k: k, m: m, n: n, row: 0, col: 0)

    }
    
    func movingCount(visited: inout [Bool], k: Int, m: Int, n: Int, row: Int, col: Int) -> Int {
        var count = 0
        if check(visited: &visited, k: k, m: m, n: n, row: row, col: col) {
            visited[row * n + col] = true
            count = 1 + movingCount(visited:  &visited, k: k, m: m, n: n, row: row - 1, col: col)
            + movingCount(visited:  &visited, k: k, m: m, n: n, row: row , col: col - 1)
            + movingCount(visited:  &visited, k: k, m: m, n: n, row: row + 1, col: col)
            + movingCount(visited:  &visited, k: k, m: m, n: n, row: row , col: col + 1)
        }
        return count
    }

    func check(visited: inout [Bool], k: Int, m: Int, n: Int, row: Int, col: Int) -> Bool {
        if (row >= 0 && row < m) && (col >= 0 && col < n) && (digitSum(row) + digitSum(col) <= k) && visited[row * n + col] == false {
            return true
        }
        return false
    }

    func digitSum(_ num: Int) -> Int {
        var sum = 0
        var tempNum = num
        while tempNum > 0 {
            sum += tempNum % 10
            tempNum = tempNum / 10
        }
        return sum
    }
    
}
