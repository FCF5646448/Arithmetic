//
//  _101_对称二叉树.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/8/19.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension BinaryTree {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        //
        func twoTreeIsSymmetric(_ leftT: TreeNode?, _ rightT: TreeNode?) -> Bool {
            if leftT == nil && rightT == nil {
                return true
            }
            guard leftT != nil && rightT != nil else {
                return false
            }

            if leftT!.val != rightT!.val {
                return false
            }

            return twoTreeIsSymmetric(leftT!.left, rightT!.right) && twoTreeIsSymmetric(leftT!.right, rightT!.left)
        }

        guard root != nil else {
            return true
        }
        return twoTreeIsSymmetric(root!.left, root!.right)
    }
}
