//
//  _113_路径总和II.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/25.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension DFS {
    /*
     113. 路径总和 II
     给定一个二叉树和一个目标和，找到所有从根节点到叶子节点路径总和等于给定目标和的路径。

     说明: 叶子节点是指没有子节点的节点。

     示例:
     给定如下二叉树，以及目标和 sum = 22，

                   5
                  / \
                 4   8
                /   / \
               11  13  4
              /  \    / \
             7    2  5   1
     返回:

     [
        [5,4,11,2],
        [5,8,4,5]
     ]
     */
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        guard root != nil else {
            return []
        }
        var result = [[Int]]()
        var tempSum:[Int] = []
        var target = sum
        dfs(root, &target, &result, &tempSum)
        return result
    }
    
    private func dfs(_ node: TreeNode?, _ target: inout Int,_ result: inout [[Int]], _ tempSum: inout [Int]) {
        guard node != nil else {
            return
        }
        
        tempSum.append(node!.val)
        target -= node!.val
        
        if node!.left == nil && node!.right == nil {
            //叶子节点
            if target == 0  {
                var level = [Int]()
                for n in tempSum {
                    level.append(n)
                }
                result.append(level)
            }
            return
        }
        
        
        dfs(node?.left, &target, &result, &tempSum)
        
        if node!.left != nil {
            target += node!.left!.val
            tempSum.removeLast()
        }
        
        
        dfs(node?.right, &target, &result, &tempSum)
        if node!.right != nil {
            target += node!.right!.val
            tempSum.removeLast()
        }
    }
    
    
}
