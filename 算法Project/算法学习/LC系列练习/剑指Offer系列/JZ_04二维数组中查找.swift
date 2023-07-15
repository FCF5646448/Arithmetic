//
//  JZ_04二维数组中查找.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/2/21.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension JZ {
    /*
     在一个二维数组中，每一行都按照从左往右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断一个数组中是否含有该整数
     */
    
    /*
     解析
     从二维数组的左下角开始查找，如果target大于当前值，则向右查找，如果target小于当前值，则向上查找
     */
    func findTargetInMatrix(_ numbers: [[Int]], _ target: Int) -> Bool {
        guard numbers.count > 0 else {
            return false
        }
        
        var i = numbers.count - 1
        let colums = numbers.first?.count ?? 0
        var j = 0
        while i >= 0 && j < colums {
            let lows = numbers[i]
            if target > lows[j] {
                j += 1
            }else if target < lows[j] {
                i -= 1
            }else{
                return true
            }
        }
        return false
    }
}
