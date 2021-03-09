//
//  JZ_07重建二叉树.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/3/1.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension JZ {
    /*
     输入某二叉树的前序遍历和中序遍历的结果，请重建该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。
     
     */
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count > 0 && preorder.count == inorder.count else {
            return nil
        }
        let root = TreeNode(preorder[0])
        var leftPreArr = [Int]()
        var leftInoArr = [Int]()
        
        var rightPreArr = [Int]()
        var rightInoArr = [Int]()
        
        var hasFoundRoot = false
        var numOfLeft = 0
        // 先找到中序遍历里的根节点，根节点之前的就是左子树的中序，之后的就是右子树的中序
        for n in inorder {
            if n == preorder[0] {
                hasFoundRoot = true
                continue
            }
            if !hasFoundRoot {
                leftInoArr.append(n)
                numOfLeft += 1
            }else{
                rightInoArr.append(n)
            }
        }
        
        // 知道了左右子树的个数后，那么第1到numOfLeft的元素都是左子树的前序，之后都是右子树的前序
        for i in 1..<preorder.count {
            if i < numOfLeft + 1 {
                leftPreArr.append(preorder[i])
            }else{
                rightPreArr.append(preorder[i])
            }
        }
        
        
        
        root.left = buildTree(leftPreArr, leftInoArr)
        
        
        root.right = buildTree(rightPreArr, rightInoArr)
        
        
        return root
    }
}
