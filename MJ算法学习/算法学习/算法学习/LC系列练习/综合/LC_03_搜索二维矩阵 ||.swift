//
//  LC_03_搜索二维矩阵 ||.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/11/2.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC {
    /*
     编写一个高效的算法来搜索 m x n 矩阵 matrix 中的一个目标值 target。该矩阵具有以下特性：

     每行的元素从左到右升序排列。
     每列的元素从上到下升序排列。
     示例:

     现有矩阵 matrix 如下：

     [
       [1,   4,  7, 11, 15],
       [2,   5,  8, 12, 19],
       [3,   6,  9, 16, 22],
       [10, 13, 14, 17, 24],
       [18, 21, 23, 26, 30]
     ]
     给定 target = 5，返回 true。

     给定 target = 20，返回 false。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xmlwi1/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    // 方法一 ：二分法查找，对于已排序的数组，二分法查找应该是较高的查找效率
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        for arr in matrix {
            if search(arr, target) {
                return true
            }
        }
        return false
    }
    
    func search(_ arr: [Int], _ target: Int) -> Bool {
        
        var left: Int = 0
        var right: Int = arr.count
        
        while left < right {
            let mid = (left + right) >> 1
            if arr[mid] > target {
                right = mid
            }else if arr[mid] < target {
                left = mid + 1
            }else{
                return true
            }
        }
        
        return false
    }
    
    
    /*
     方法二 ：
     从这个二维矩阵的特点，我们假设从二维矩阵的左下角(i,j)开始查找，当taget < matrix[i][j]时，行数减一，当taget > matrix[i][j] 列数加一
    */
    func searchMatrix2(_ matrix: [[Int]], _ target: Int) -> Bool {
        var row = matrix.count - 1
        var lum = 0
        while row >= 0 && lum < (matrix.first?.count ?? 0) {
            if matrix[row][lum] > target {
                row -= 1
            }else if matrix[row][lum] < target {
                lum += 1
            }else{
                return true
            }
        }
        return false
    }
    
}
