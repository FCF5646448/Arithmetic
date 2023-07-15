//
//  JZ_12矩阵中的路径.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/4/13.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension JZ {
    /*
     给定一个 m x n 二维字符网格 board 和一个字符串单词 word 。如果 word 存在于网格中，返回 true ；否则，返回 false 。

     单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。

     作者：画手大鹏
     链接：https://leetcode-cn.com/leetbook/read/illustrate-lcof/eo4zg5/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard board.count > 0 && board.first!.count > 0 && word.count > 0 else{
            return false
        }
        let rows = board.count
        let cols = board.first!.count
        let wordArr = Array(word)

        var visited = Array(repeating: false, count: rows * cols)
        var position = 0
        for row in 0..<rows {
            for col in 0..<cols {
                if hasPathCore(board: board, wordArr: wordArr, visited: &visited, rows: rows, cols: cols, row: row, col: col, position: &position) {
                    return true
                }
            }
        }
        return false
    }

    func hasPathCore(board: [[Character]], wordArr: [Character], visited: inout [Bool] , rows: Int, cols: Int, row: Int, col: Int, position: inout Int) -> Bool {
        guard position < wordArr.count else{
            return true
        }
        var result = false

        if (row >= 0 && row < rows) && (col >= 0 && col < cols) && board[row][col] == wordArr[position] && visited[row * cols + col] == false {
            position += 1
            visited[row * cols + col] = true
            result = hasPathCore(board: board, wordArr: wordArr, visited: &visited, rows: rows, cols: cols, row: row, col: col - 1, position: &position)
            || hasPathCore(board: board, wordArr: wordArr, visited: &visited, rows: rows, cols: cols, row: row - 1, col: col, position: &position)
            || hasPathCore(board: board, wordArr: wordArr, visited: &visited, rows: rows, cols: cols, row: row, col: col + 1, position: &position)
            || hasPathCore(board: board, wordArr: wordArr, visited: &visited, rows: rows, cols: cols, row: row + 1, col: col, position: &position)

            if result == false {
                position -= 1
                visited[row * cols + col] = false
            }
        }
        return result
    }
    
}
