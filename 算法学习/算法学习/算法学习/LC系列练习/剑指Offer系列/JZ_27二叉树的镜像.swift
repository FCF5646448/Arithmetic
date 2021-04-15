//
//  JZ_27二叉树的镜像.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/4/14.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension JZ {
    /*
     输入一个二叉树，该函数输出它的镜像。
     */
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else{
            return root
        }

        let tempTree = root!.left
        root!.left = root!.right
        root!.right = tempTree

        if root!.left != nil {
            _ = mirrorTree(root!.left)
        }

        if root!.right != nil {
            _ = mirrorTree(root!.right)
        }

        return root
    }
}
