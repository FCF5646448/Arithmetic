//
//  _LC3_盛最多水的容器.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/15.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC3 {
    /*
     盛最多水的容器
     给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

     说明：你不能倾斜容器。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/all-about-array/x96n4v/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     解题思路
     盛最多水，其实也就是求两个坐标中的面积最大。
     要算面积，肯定是同时获取左右两边的数。所以使用双指针
     面积 = 长 * 高
     首先对于长度，如论是左侧指针往右移，还是右侧指针往左移，还是两端同时移，那么长度都是减少的。
     要使面积尽可能大，则需要肯定是高度尽可能高
     而高度是使用两端更低的高度。
     所以，计算完成后，让更低的指针向高的一方移动。
     */
    
    /*
     碰撞指针法
     */
    func maxArea(_ height: [Int]) -> Int {
        var i = 0
        var j = height.count - 1
        var area = (j - 1) * min(height[i], height[j])
        
        while i < j {
            if height[i] < height[j] {
                i += 1
            }else{
                j -= 1
            }
            
            area = max(area, (j - 1) * min(height[i], height[j]))
        }
        
        return area
    }
}
