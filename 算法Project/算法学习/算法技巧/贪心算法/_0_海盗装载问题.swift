//
//  _0_海盗装载问题.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/13.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension Greedy {
    /*
     一艘海盗船装载宝物，每个宝物都是价值连城weights，但是必须得是完整的宝物，假设海盗船最多只能装载重量为mostWight.
     求海盗船最多能装载多少个宝物
     
     解析：
     使用贪心算法，每次都装载最小重量的宝物。
    
     */
    func mastCount(_ weights:[Int],_ mostWight:Int) -> Int {
        //第一步，先对宝物进行排序
        var ws = weights
        quickSort(&ws, 0, ws.count - 1)
        print(ws)
        //然后从小到大进行装载
        var count = 0, allWeights = 0
        var i = 0
        while i < ws.count && allWeights < mostWight {
            let newWeight = allWeights + ws[i]
            if newWeight <= mostWight {
                allWeights = newWeight
                count += 1
                print("第\(i)个宝物选择的是\(ws[i])斤重的宝物")
            }
            i += 1
        }
        print("共选择了\(count)件宝物")
        return count
    }
    
    
    func quickSort(_ arr: inout [Int],_ left:Int,_ right:Int) {
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
            
            let t = arr[l]
            arr[l] = arr[r]
            arr[r] = t
        }
        
        arr[left] = arr[l]
        arr[l] = temp
        
        quickSort(&arr, left, l - 1)
        quickSort(&arr, r + 1, right)
        
        
    }
}
