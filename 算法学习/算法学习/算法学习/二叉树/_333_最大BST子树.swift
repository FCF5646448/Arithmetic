//
//  _333_最大BST子树.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/23.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension TreeNode {
    /*
     333：最大BST子树
     给定一个二叉树，找到其中最大的二叉搜索子树。其中最大指的是子树节点最多
     注意：子树必须包含器所有后代
     返回子树的节点数量。
     */
    
    /*
     如果root为根节点的二叉树S是BST，就返回S的节点数量
     否则，就返回func(root.left)、func(root.right)中的最大值
     */
    func largestBSTSubtree(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        
        if isBST(root!) {
            return nodeCount(root!)
        }
        
        return max(largestBSTSubtree(root!.left), largestBSTSubtree(root!.right))
    }
    
    // 判断是否为BST
    func isBST(_ root: TreeNode) -> Bool {
        return false
    }
    
    // 返回节点数量
    func nodeCount(_ root: TreeNode) -> Int {
        
    }
}
