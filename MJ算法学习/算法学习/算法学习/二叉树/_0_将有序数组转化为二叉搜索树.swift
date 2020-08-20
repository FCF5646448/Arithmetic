//
//  _0_将有序数组转化为二叉搜索树.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/8/20.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension BinaryTree {
    /*
     将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。

     本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。

     示例:

     给定有序数组: [-10,-3,0,5,9],

     一个可能的答案是：[0,-3,9,-10,null,5]，它可以表示下面这个高度平衡二叉搜索树：

           0
          / \
        -3   9
        /   /
      -10  5

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xninbt/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     
     解析：中间节点
     
     12345 ---> 根节点 3 index = 2
     123456 ----> 根节点 4 index = 3
     mid = count/2
     0..<mid ---> leftTree
     mid+1..<count
     */
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else{
            return nil
        }
        let midIndex = nums.count/2
        let root = TreeNode(nums[midIndex])
        
        let leftNums = Array(nums[...(midIndex - 1)])
        root.left = sortedArrayToBST(leftNums)
        
        let rightNums = Array(nums[(midIndex+1)...])
        root.right = sortedArrayToBST(rightNums)
        
        return root
    }
}
