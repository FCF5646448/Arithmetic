//
//  _977_有序数组的平方.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/9/17.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Solution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        func quictSort(_ arr: inout [Int], _ left: Int, _ right: Int) {
            if left > right {
                return
            }
            var l = left
            var r = right
            let temp = arr[left]
            while l < r {
                while l < r && arr[r] >= temp {
                    r -= 1
                }
                while l < r && arr[l] <= temp {
                    l += 1
                }
                if l < r {
                    let t = arr[l]
                    arr[l] = arr[r]
                    arr[r] = t
                }
            }
            arr[left] = arr[l]
            arr[l] = temp
            quictSort(&arr, left, l - 1)
            quictSort(&arr, l + 1, right)
        }
        
        var newArr = [Int]()
        for n in A {
            newArr.append(n * n)
        }
        quictSort(&newArr, 0, newArr.count - 1)
        return newArr
    }
}
