//
//  _0_零钱兑换问题.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/13.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Greedy {
    /*
     问题描述：有固定面值的纸币币，将money兑换成零钱，求最少兑换数
     
     解析：
     每一次都选择面值最大的硬币。
     其次面值的数量时可以重复选择的
     
     注意：这里使用贪心算法其实得不到最优解。假设币值为[25,20,5,1],money为41.
     那么这里得到的解就是25、5、5、5、1；
     但其实最优解应该是20、20、1；
     */
    func coinsChange(_ faces:[Int],_ money:Int) -> Int {
        //第一步：排序
        var fs = faces
        mergeSort(&fs, 0, fs.count)
        print(fs)
        
        //第二步：选择最大
        var count = 0, selectedCountMoney = 0
        var i = 0
        while i < fs.count && selectedCountMoney < money {
            let newCountMoney = fs[i] + selectedCountMoney
            if newCountMoney <= money {
                selectedCountMoney = newCountMoney
                count += 1
                print("第\(count)张是币值为\(fs[i])的钞票")
            }else{
                i += 1
            }
        }
        print("共选择了\(count)张纸币")
        return count
    }
    
    //进行归并排序
    func mergeSort(_ arr: inout [Int], _ left:Int, _ right:Int) {
        guard right - left > 1 else { //切割到1个元素为止
            return
        }
        
        let middle = (left + right) >> 1
        mergeSort(&arr, left, middle)
        mergeSort(&arr, middle, right)
        
        merge(&arr, left, middle, right)
        
    }
    
    //归并
    func merge(_ arr:inout [Int], _ begin:Int, _ mid:Int, _ end:Int) {
        var li = 0
        let le = mid - begin
        var ri = mid
        let re = end
        var ai = begin
        
        var tempArr = [Int]()
        for i in 0..<le {
            tempArr.append(arr[i + begin])
        }
        
        //从大到小归并
        while li < le {
            if ri < re && arr[ri] > tempArr[li] {
                arr[ai] = arr[ri]
                ai += 1
                ri += 1
            }else{
                arr[ai] = tempArr[li]
                ai += 1
                li += 1
            }
        }
        
    }
    
}
