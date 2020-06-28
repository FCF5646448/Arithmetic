//
//  _0107_旋转矩阵.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/26.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension ArrayList {
    /*
     
     给你一幅由 N × N 矩阵表示的图像，其中每个像素的大小为 4 字节。请你设计一种算法，将图像旋转 90 度。
     给定 matrix =
     [
       [1,2,3],
       [4,5,6],
       [7,8,9]
     ],

     原地旋转输入矩阵，使其变为:
     [
       [7,4,1],
       [8,5,2],
       [9,6,3]
     ]
     
     各种牛逼解法：https://zhuanlan.zhihu.com/p/106971744
     
     这里用的是二次置换法：先以对角线为轴交换元素，然后顺时针则是每一行左右交换元素，逆时针则是每一列交换元素
     注意，对角线交换的时候，从第i列h开始到每一行的末尾
     
     */
    
    func rotate(_ matrix: inout [[Int]]) {
        
        //先以对角线为轴进行交换
        for i in 0..<matrix.count {
            for j in i..<matrix.count { //注意这个范围
                //
                (matrix[i][j],matrix[j][i]) = (matrix[j][i],matrix[i][j])
            }
        }
        
        print(matrix)
        //然后每一行左右交换
        for i in 0..<matrix.count {
            let row = matrix[i]
            for j in 0..<row.count/2 { //注意这个范围以及下标计算
                (matrix[i][j],matrix[i][row.count - j - 1]) = (matrix[i][row.count - j - 1],matrix[i][j])
            }
        }
        
        print(matrix)
        
    }
}
