//
//  _0108_零矩阵.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/27.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension ArrayList {
    /*
     编写一种算法，若M × N矩阵中某个元素为0，则将其所在的行与列清零。
     输入：
     [
       [1,1,1],
       [1,0,1],
       [1,1,1]
     ]
     输出：
     [
       [1,0,1],
       [0,0,0],
       [1,0,1]
     ]
     
     **解析**
     大多数二维数组问题都是计算坐标
     
     */
    func setZeroes(_ matrix: inout [[Int]]) {
        guard matrix.count > 0 else {
            return
        }
        //先要记录状态
        var flag = Array(repeating: Array(repeating: true, count: matrix.first!.count), count: matrix.count)
        for i in 0..<matrix.count {
            let item = matrix[i]
            for (j,n) in item.enumerated() {
                if n == 0 {
                    //i行所有元素都清0
                    flag[i] = Array(repeating: false, count: item.count)
                    //j列清零
                    for k in 0..<matrix.count {
                        flag[k][j] = false
                    }
                }
            }
        }
        
        for i in 0..<matrix.count {
            let item = matrix[i]
            for j in 0..<item.count {
                if flag[i][j] == false {
                    matrix[i][j] = 0
                }
            }
        }
        
    }
    
}
