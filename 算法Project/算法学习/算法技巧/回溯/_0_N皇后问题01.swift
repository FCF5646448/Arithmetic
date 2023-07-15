//
//  _0_N皇后问题.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/11.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

class Queen {
    
    //用一个数组存放已经摆放的皇后：下标是行号row，值是列col ， cols[row] = col;
    var cols:[Int]!
    var ways = 0
    
    //代表有n个皇后
    func queen(_ n:Int) {
        guard n > 0 else {
            return
        }
        //
        cols = Array(repeating: 0, count: n)
        place(0)
        
        print("\(n)个皇后，一共有\(ways)个解法")
    }
    
    //回溯查找
    func place(_ row:Int) {
        if row == cols.count {
            //当来到这里的时候，肯定就是已经摆放完了
            ways += 1
            show()
            return
        }
        //
        for col in 0..<cols.count {
            if isValid(row, col) {
                //当有效的时候，就摆上皇后，然后查找下一行。
                cols[row] = col
                place(row + 1)
            }
        }
        //当函数退出的时候，有两种情况，整个一行查找完成了，但是没有找到，
    }
    
    //查看某一个坐标位置是否有效，也就是没有出现在已有皇后的同行、同列、同斜线
    func isValid(_ row:Int, _ col:Int) -> Bool {
        for i in 0..<row {
            if cols[i] == col { return false} //和第i行处于同一列
            if (row - i) == abs(col - cols[i]) {
                //处于同一斜线。这个是用斜率来算
                return false
            }
        }
        
        return true
    }
 
    //打印出来
    func show() {
        print("*******************第\(ways)种*************************\n")
        for row in 0..<cols.count {
            var str = ""
            for col in 0..<cols.count {
                if cols[row] == col {
                    str += " ♕"
                }else{
                    str += " ♞"
                }
            }
            print(str)
        }
        
    }
    
}
