//
//  _54_螺旋矩阵.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/28.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension HF {
    
    /*
     给定一个包含 m x n 个元素的矩阵（m 行, n 列），请按照顺时针螺旋顺序，返回矩阵中的所有元素。

     示例 1:

     输入:
     [
      [ 1, 2, 3 ],
      [ 4, 5, 6 ],
      [ 7, 8, 9 ]
     ]
     输出: [1,2,3,6,9,8,7,4,5]
     示例 2:

     输入:
     [
       [1, 2, 3, 4],
       [5, 6, 7, 8],
       [9,10,11,12]
     ]
     输出: [1,2,3,4,8,12,11,10,9,5,6,7]

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/spiral-matrix
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    /*
     其实就是一圈一圈遍历。
     首先
     用top指向第一行，
     用bottom指向最后一行
     用left指向第一列
     用right指向最后一列
     
     顺时针方向，所以遍历顺序肯定是 top —— right —— bottom —— left
     
     其次每完成一个需要对方向遍历进行处理。
     处理完第一行：top ++
     处理完最后一列：right --
     处理完最后一行：bottom--
     处理完第一列：left ++
     
     
     */
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard matrix.count > 0 else {
            return []
        }
        
        var result: [Int] = []
        var top = 0
        var bottom = matrix.count  - 1
        var left = 0
        var right = matrix.first!.count - 1
        
        while top <= bottom && left <= right {
            // 左上角到右上角
            var i = left
            while i <= right  {
                result.append(matrix[top][i])
                i += 1
            }
            top += 1
            if top > bottom { break }
            
            //从右上角到右下角
            i = top
            while i <= bottom {
                result.append(matrix[i][right])
                i += 1
            }
            right -= 1
            if left > right { break }
            
            // 右下角到左下角
            i = right
            while i >= left {
                result.append(matrix[bottom][i])
                i -= 1
            }
            
            bottom -= 1
            if top > bottom { break }
            
            // 从左下角到左上角
            i = bottom
            while i >= top {
                result.append(matrix[i][left])
                i -= 1
            }
            left += 1
            
        }
        
        return result
    }
}
