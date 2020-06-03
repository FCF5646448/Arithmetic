//
//  QuickSort.swift
//  ArithmeticSwift
//
//  Created by 冯才凡 on 2020/6/3.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

class QuickSort {
    func subSort(_ array: [Int]) -> [Int] {
        func quickSort(_ arr: inout [Int], _ l:Int, _ r:Int) {
            var left = l + 1
            var right = r
            let temp = arr[l]

            while left < right {
                while right > left && arr[right] > temp {
                    right -= 1
                }
                while right > left && arr[left] < temp {
                    left += 1
                }
                if right > left {
                    let tp = arr[left]
                    arr[left] = arr[right]
                    arr[right] = tp
                }
            }
            
            arr[l] = arr[left]
            arr[left] = temp
            
            quickSort(&arr, 0, right)
            quickSort(&arr, right + 1, arr.count)
            
        }
        
        var result:[Int] = array
        quickSort(&result,0,array.count)
        print(result)
        return result
    }
}
