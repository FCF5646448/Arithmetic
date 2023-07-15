//
//  _11_能盛放最多水的容器.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/29.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension HF {
    /*
     11. 盛最多水的容器
     给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

     说明：你不能倾斜容器。
     */
    
    /*
     指针碰撞法
     //
     
     */
    func maxArea(_ height: [Int]) -> Int {
        var i = 0
        var j = height.count - 1
        
        var sumArea = Int.min
        while i < j {
            
            if height[i] > height[j] {
                let rea = height[j] * (j - i)
                if rea > sumArea {
                    sumArea = rea
                }
                j -= 1
            }else{
                let rea = height[i] * (j - i)
                if rea > sumArea {
                    sumArea = rea
                }
                i += 1
            }
        }
        
        return sumArea
    }
}
