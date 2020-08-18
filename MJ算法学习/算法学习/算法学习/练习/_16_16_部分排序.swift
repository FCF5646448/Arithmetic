//
//  _16_16_部分排序.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/29.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Solution{
    /* 给定一个整数数组，编写一个函数，找出索引m和n，只要将索引区间[m,n]的元素排好序，整个数组就是有序的。注意：n-m尽量最小，也就是说，找出符合条件的最短序列。函数返回值为[m,n]，若不存在这样的m和n（例如整个数组是有序的），请返回[-1,-1]。

     示例：

     输入： [1,2,4,7,10,11,7,12,6,7,16,18,19]
     输出： [3,9]

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/sub-sort-lcci
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     
     
     解析：确定范围就是查找逆序对，逆序对就是顺序相反的值
     
     
     */
    
    func subSort(_ array: [Int]) -> [Int] {
        guard array.count > 0 else {
            return [-1,-1]
        }
        
        //从左往右扫描，找到最右侧的逆序对. max 记录扫描过的路径中最大的值，right记录最右逆序对的下标
        var max = array[0]
        var right:Int = -1
        var i = 1
        while i < array.count {
            if array[i] >= max {
                max = array[i]
            }else{
                right = i
            }
            i += 1
        }
        
        //提前结束
        if right == -1 {return [-1, -1]}
        //从右往左扫描，找到最左侧的逆序对. min 记录扫描过的路径中最小的值，left记录最左逆序对的下标
        var min = array[array.count - 1]
        var left:Int = -1
        i = array.count - 2
        while i >= 0 {
            if array[i] <= min {
                min = array[i]
            }else{
                left = i
            }
            i -= 1
        }
        return [left,right]
    }
    
}
