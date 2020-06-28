//
//  _56_合并区间.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/26.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension ArrayList {
    /*
     输入: [[1,3],[2,6],[8,10],[15,18]]
     输出: [[1,6],[8,10],[15,18]]
     解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
     
     输入: [[1,4],[4,5]]
     输出: [[1,5]]
     解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。
     */
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else{
               return intervals
        }
        var temp = intervals
           //先排序

        quickSort(&temp, 0, temp.count - 1)
        
        var i = 1
        while i < temp.count {
            let preItem = temp[i - 1]
            let currItem = temp[i]
            if let preFirst = preItem.first, let preLast = preItem.last, let currFirst = currItem.first,let currLast = currItem.last, preLast >= currFirst && preFirst <= currLast {
                //合并
                temp.remove(at: i)
                temp[i-1] = [min(preFirst,currFirst),max(preLast, currLast)]
            }else{
                i += 1
            }
        }
        
        return temp
    }
    
    
    func quickSort(_ arr: inout [[Int]], _ left:Int, _ right:Int) {
        if left > right {
            return
        }
        var i = left
        var j = right
        let temp = arr[left]

        while i < j {
            while i < j && arr[j].first! >= temp.first! { //注意这里必须等于
                j -= 1
            }

            while i < j && arr[i].first! <= temp.first! {
                i += 1
            }

            if i < j {
                let temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
            }
        }

        arr[left] = arr[i]
        arr[i] = temp
        quickSort(&arr,left,i - 1)
        quickSort(&arr,i + 1,right)

    }

}
