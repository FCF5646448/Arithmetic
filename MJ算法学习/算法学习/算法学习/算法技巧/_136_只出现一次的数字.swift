//
//  _136_只出现一次的数字.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/21.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Solution {
    /*
     给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

     说明：

     你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

     示例 1:

     输入: [2,2,1]
     输出: 1
     示例 2:

     输入: [4,1,2,1,2]
     输出: 4

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/single-number
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     
     
     解析：任何数与0异或都是它本身。任何数和本身做异或得到的都是0
     
     */
    func singleNumber(_ nums: [Int]) -> Int {
        var single = 0
        for item in nums {
            single ^= item
        }
        return single
    }
}
