//
//  JZ_28对称的二叉树.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/4/14.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation


extension JZ {
    /*
     请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。

     例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
     */
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard root != nil else{
            return true
        }
        return isSymmetric(leftTree: root!.left, rightTree: root!.right)
    }

    func isSymmetric(leftTree: TreeNode?, rightTree: TreeNode?) -> Bool {
        if leftTree == nil && rightTree == nil {
            return true
        }
        guard leftTree != nil && rightTree != nil else {
            return false
        }
        
        if leftTree!.val != rightTree!.val {
            return false
        }
        return isSymmetric(leftTree: leftTree!.left, rightTree: rightTree!.right) &&
        isSymmetric(leftTree: leftTree!.right, rightTree: rightTree!.left)
    }
}
