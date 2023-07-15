//
//  _LC3_颜色分类.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/13.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC3 {
    /*
     给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

     此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/all-about-array/x9wv2h/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     解析思路
     相当于把0往左移，2往右移
     所以使用一个指针，指向0的位置，只有一个指针指向2的位置，然后使用一个指针遍历
     
     尤其要注意循环结束条件
     
     这种方法也叫做3路快速排序算法
     设置三个 lt, gt, i 定义：nums[0...lt] == 0，nums[lt+1...i-1] = 1，nums[gt...n-1] == 2，遍历一遍改数列保持这个定义。
     */
    func sortColors(_ nums: inout [Int]) {
        var i = 0
        var l = 0
        var r = nums.count - 1
        while i <= r {
            if nums[i] == 0 {
                // 可能左移，之所以左移，因为当前有可能是第一个位置，没法移动
                if i > l {
                    if nums[l] != 0 {
                        (nums[i], nums[l]) = (nums[l], nums[i])
                    }
                    l += 1
                    // 之所以 continue，是因为交换完之后，还需要重新判断交换之后的值
                    continue
                }
            }else if nums[i] == 2 {
                if nums[r] != 2 {
                    (nums[i], nums[r]) = (nums[r], nums[i])
                }
                r -= 1
                continue
            }
            
            i += 1
        }
    }
}
