//
//  _42_接雨水.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/29.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension HF {
    /*
     42. 接雨水
     给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

      

     示例 1：



     输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
     输出：6
     解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。
     */
    
    /*
     方法：
     从左到右遍历，查看每根柱子上能够装下的水
     当前柱子上的装水 = min(左边柱子的最大值，右边柱子的最大值) - 当前柱子的高度
     所以左右两边都要有比自己更高的柱子才能装水
     */
    func trap(_ height: [Int]) -> Int {

        guard height.count > 2 else {
            return 0
        }
        
        // 每一个柱子左边的最大值
        var leftMaxH:[Int] = [Int](repeating: 0, count: height.count)
        // 每一个柱子右边的最大值
        var rightMaxH:[Int] = [Int](repeating: 0, count: height.count)
        
        // 通过动态规划的思想计算
        var i = 1
        while i < height.count {
            leftMaxH[i] = max(leftMaxH[i - 1], height[i - 1])
            i += 1
        }
        
        i = height.count - 1
        while i > 0 {
            rightMaxH[i] = max(rightMaxH[i + 1], height[i + 1])
            i -= 1
        }
        
        var water = 0
        //遍历每一根柱子能放多少水
        for i in 1..<height.count - 1 {
            let m = min(leftMaxH[i], rightMaxH[i])
            if m <= height[i] {
                // 说明不能装水
                continue
            }
            
            water += m - height[i]
        }
        
        return water
    }
}
