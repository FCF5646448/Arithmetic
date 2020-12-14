//
//  _226_翻转二叉树.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/16.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension BinaryTree {
    //226. 翻转二叉树 只要能够遍历所有节点，那么就可以实现翻转
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root
        }
        //前序
        let temp = root!.left
        root!.left = root!.right
        root!.right = temp
        
        root!.left = invertTree(root!.left)
        root!.right = invertTree(root!.right)
        
        return root
    }
    
    func invertTree1(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root
        }
        //中序
        root!.left = invertTree(root!.left)
        
        let temp = root!.left
        root!.left = root!.right
        root!.right = temp
        
        //注意这里还是遍历左子树，因为上面已经交换完了
        root!.right = invertTree(root!.left)
        
        return root
    }
    
    func invertTree2(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root
        }
        
        //后续
        
        root!.left = invertTree(root!.left)
        root!.right = invertTree(root!.right)
        
        let temp = root!.left
        root!.left = root!.right
        root!.right = temp
        
        return root
    }
}
