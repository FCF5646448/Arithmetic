//
//  _498_对角线遍历.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/27.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension ArrayList {
    /*
     给定一个含有 M x N 个元素的矩阵（M 行，N 列），请以对角线遍历的顺序返回这个矩阵中的所有元素，对角线遍历如下图所示
     输入:
     [
      [ 1, 2, 3 ],
      [ 4, 5, 6 ],
      [ 7, 8, 9 ]
     ]

     输出:  [1,2,4,7,5,3,6,8,9]
     */
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
        let rowCount = matrix.count
        guard let rankCount = matrix.first?.count, rowCount > 0 && rankCount > 0 else {
            return []
        }
        var result = [Int]()
        
        var row = 0
        var rank = 0
        var i = 0
        while i < rowCount*rankCount {
            result.append(matrix[row][rank])
            //(row + rank)是偶数往上走，奇数往下走
            if (row + rank) % 2 == 0 {
                if rank == rankCount - 1 {
                    //元素在最后一列，往下走
                    row += 1
                }else if row == 0 {
                    //元素在第一行，往右走
                    rank += 1
                }else{
                    //往右上走
                    row -= 1
                    rank += 1
                }
            }else{
                if row == rowCount - 1 {
                    //元素在最后一行，往右走
                    rank += 1
                }else if rank == 0 {
                    //元素在第一列,往下走
                    row += 1
                }else{
                    //往左下走
                    row += 1
                    rank -= 1
                }
            }
            
            i += 1
        }
        
        return result
    }
}
