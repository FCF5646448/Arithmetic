//
//  _0_二分搜索.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/5.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension ArrayList {
    //二分搜索
    func binarySearch(_ arr:inout [Int],_ target:Int) -> Int? {
        
        //左闭右开
        var begin = 0
        var end = arr.count
        
        while  begin < end {
            //位移效率比除法效率高很多
            let mid = (begin + end) >> 1
            if arr[mid] > target {
                end = mid
            }else if arr[mid] < target {
                begin = mid + 1
            }else{
                return mid
            }
        }
        
        return nil
    }
}
