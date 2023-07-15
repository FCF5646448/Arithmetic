//
//  _236_二叉树的最近公共祖先.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/20.
//  Copyright © 2020 冯才凡. All rights reserved.

import Foundation


extension TreeNode {
    /*
     去以root为根节点的二叉树中查找p、q的最近公共祖先
     1、如果p、q同时存在于这棵二叉树中，就能成功返回它们的最近公共祖先；
     2、如果q、p都不存在于这棵二叉树中，返回null
     3、如果只有p存在于这棵二叉树中，返回p
     4、如果只有q存在于这棵二叉树中，返回q
     */
    func lowerstCommonAnCestor(root:TreeNode?, p:TreeNode!, q:TreeNode!) -> TreeNode? {
        if root == nil || root! == p || root! == q {
            return root
        }

        //去以root.left为根节点的二叉树中查找p、q的最近公共祖先
        let left = lowerstCommonAnCestor(root: root!.left, p: p, q: q)
        
        //去以root.right为根节点的二叉树中查找p、q的最近公共祖先
        let right = lowerstCommonAnCestor(root: root!.right, p: p, q: q)
        
        if left != nil && right != nil {
            return root
        }
        
        if left != nil  && right == nil {
            return left
        }
        
        if right != nil  && left == nil {
            return right
        }
        
        return nil
        
    }
    
}

