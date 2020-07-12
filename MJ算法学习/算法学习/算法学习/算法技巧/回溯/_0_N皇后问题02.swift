//
//  _0_N皇后问题02.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/11.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

//N皇后问题第二种解法
class Queen2 {
    
    //用一个数组存放已经摆放的皇后：下标是行号row，值是列col ， queue[row] = col;
    var queues:[Int]!
    
    //表示某一列已经有皇后
    var cols:[Bool]!
    
    //表示从左上角到右下角的斜线有皇后
    var leftTop:[Bool]!
    //表示从右上角到左下角的斜线有皇后
    var  rightTop:[Bool]!
    
    var ways = 0
    
    //代表有n个皇后
    func queen(_ n:Int) {
        guard n > 0 else {
            return
        }
        //
        queues = Array(repeating: 0, count: n)
        cols = Array(repeating: false, count: n)
        //每一个斜线方向都有2*n - 1条斜线
        leftTop = Array(repeating: false, count: (n << 1 - 1))
        rightTop = Array(repeating: false, count: leftTop.count)
        
        
        place(0)
        
        print("\(n)个皇后，一共有\(ways)个解法")
    }
    
    //
    func place(_ row:Int) {
        if row == cols.count {
            ways += 1
            show()
            return
        }
        
        for col in 0..<cols.count {
            //如果发现当前列，当前斜线都有皇后，就往下一列
            if cols[col] { continue }
            let ltIndex = row - col + cols.count - 1 //左斜线下标是row - col + （ n - 1 ）
            if leftTop[ltIndex] { continue }
            let rtIndex = row + col //右斜线下标 row + col
            if rightTop[rtIndex] { continue }
            
            
            queues[row] = col
            cols[col] = true
            leftTop[ltIndex] = true
            rightTop[rtIndex] = true
            
            place(row + 1)
            
            cols[col] = false
            leftTop[ltIndex] = false
            rightTop[rtIndex] = false
            
        }
        
    }
    
    
    //打印出来
    func show() {
        print("*******************第\(ways)种*************************\n")
        for row in 0..<cols.count {
            var str = ""
            for col in 0..<cols.count {
                if queues[row] == col {
                    str += " ♕"
                }else{
                    str += " *"
                }
            }
            print(str)
        }
        
    }
    
    
}
