//
//  _LC3*_岛屿数量.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/18.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC3 {
    /*
     岛屿数量
     给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。

     岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。

     此外，你可以假设该网格的四条边均被水包围。

      

     示例 1：

     输入：grid = [
       ["1","1","1","1","0"],
       ["1","1","0","1","0"],
       ["1","1","0","0","0"],
       ["0","0","0","0","0"]
     ]
     输出：1


     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/queue-stack/kbcqv/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     广度优先遍历.
     这道题的难点不在于广度遍历，而在于把已访问过的陆地改掉，然后陆地的统计是一个技巧
     */
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else {
            return 0
        }
        var queue:[(row:Int,col:Int)] = []
        var newGrid = grid
       
        var isLandCount = 0
        for (i,rows) in newGrid.enumerated() {
            for (j,_) in rows.enumerated() {
                let node = newGrid[i][j]
                if node == "1" {
                    //是岛屿
                    isLandCount += 1
                    
                    newGrid[i][j] = "2" //访问过的设置为2
                    queue.append((i,j))
                    
                    // 以当前对齐中的陆地为出发点，对周伟大陆进行广度优先遍历
                    while !queue.isEmpty {
                        let n = queue.removeFirst()
                       
                        // 上
                        if n.row - 1 >= 0 && newGrid[n.row - 1][n.col] == "1" {
                            newGrid[n.row - 1][n.col] = "2"
                            queue.append((n.row - 1,n.col))
                        }
                        
                        // 下
                        if n.row + 1 < newGrid.count && newGrid[n.row + 1][n.col] == "1" {
                            newGrid[n.row + 1][n.col] = "2"
                            queue.append((n.row + 1, n.col))
                        }
                        
                        // 左
                        if n.col - 1 >= 0 && newGrid[n.row][n.col - 1] == "1" {
                            newGrid[n.row][n.col - 1] = "2"
                            queue.append((n.row, n.col - 1))
                        }
                        
                        // 右
                        if n.col + 1 < rows.count && newGrid[n.row][n.col + 1] == "1" {
                            newGrid[n.row][n.col + 1] = "2"
                            queue.append((n.row, n.col + 1))
                        }
                    }
                }
            }
        }
        return isLandCount
    }
}
