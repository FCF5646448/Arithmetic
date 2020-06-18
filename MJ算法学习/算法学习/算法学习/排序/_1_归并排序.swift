//
//  _1_归并排序.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/17.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Sort {
    
    /*
     解析：归并排序，就是先将数组逐渐拆分。直到最小组成单元，然后再逐渐合并，合并的过程中，进行数据大小的比较交换。
     */
    func mergerSort() {
        var arr = [2,1,3,5,67,3,4,768,9,546,5,7,8,9,44,23,6,9,8,3,4,5,75,5,7,3,4,8,9,0,56,8,8,9,6,3,2]
        
        sort(&arr, 0, arr.count)
        print(arr)
    }
    
    
    func sort(_ arr:inout [Int], _ begin:Int, _ end:Int) {
        
        if end - begin < 2 {
            return
        }
        
        let mid = (begin + end)/2
        
        sort(&arr, begin, mid)
        sort(&arr, mid, end)
        merge(&arr, begin, mid, end)
    }
    
    
    func merge(_ arr:inout [Int], _ begin:Int, _ mid:Int, _ end:Int) {
        var li = 0
        let le = mid - begin
        var ri = mid
        let re = end
        var ai = begin
        
        //开辟一个小数组，用于装取arr的一半数据，
        var temp = [Int]()
        for i in li..<le {
            temp.append(arr[begin + i])
        }
        
        //循环比较，直到临时小数组元素全部放到了arr中
        while li < le {
            if ri < re && (arr[ri] < temp[li]) {
                arr[ai] = arr[ri]
                ai += 1
                ri += 1
            }else{
                arr[ai] = temp[li]
                ai += 1
                li += 1
            }
        }
        
    }
    
}
