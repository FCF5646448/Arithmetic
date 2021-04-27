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
    
    //这里的end是开区间。
    fileprivate func sort(_ arr:inout [Int], _ begin:Int, _ end:Int) {
        guard end - begin > 1 else{ return }
        
        //先切割
        let mid = (begin + end) >> 1
        sort(&arr, begin, mid) //这里不包含mid
        sort(&arr, mid, end) //这里包含了mid，不包含end元素
        
        //再合并
        merge(&arr, begin, mid, end)
    }
    
    //都是左闭右开的，主要这里实际没有使用end
    fileprivate func merge(_ arr:inout [Int],_ begin:Int,_ mid:Int, _ end:Int) {
        var li = 0  //注意这个是临时数组的0下标，所以切记标成begin
        let le = mid - begin //这个是零时数组的右边界，切忌标记成mid，因为begin不一定是从0开始
        var ai = begin
        var ri = mid //包括mid
        let re = end //不包括end
        
        var temp = [Int]()
        for i in li..<le {
            temp.append(arr[begin + i])
        }
        
        //循环比较，直到临时小数组元素全部放到了arr中
        while li < le {
            if ri < re && arr[ri] < temp[li] {
                //将后半部分按序放到数组
                arr[ai] = arr[ri]
                ai += 1
                ri += 1
            }else {
                //将零时数组中的对应元素部分按序放到数组
                arr[ai] = temp[li]
                ai += 1
                li += 1
            }
        }
        
    }
}


extension Sort {
    func s(_ nums: inout [Int], _ begin: Int, _ end: Int) {
        guard end > begin else{
            return
        }
        
        let m = (begin + end) >> 2
        s(&nums, begin, m)
        s(&nums, m, end)
        
        
    }
    
    func mg(_ nums: inout [Int], _ begin: Int, _ mid: Int, _ end: Int) {
        var temArr = [Int]() //存数组begin~mid的部分
        var li = 0
        let le = mid - begin
        var oi = mid
        let oe = end
        var curr = begin
        for i in li..<le {
            temArr.append(nums[begin + i])
        }
        
        while li < le {
            if oi < oe && nums[oi] < temArr[li] {
                nums[curr] = nums[oi]
                curr += 1
                oi += 1
            }else {
                nums[curr] = temArr[li]
                li += 1
                curr += 1
            }
        }
    }
}
