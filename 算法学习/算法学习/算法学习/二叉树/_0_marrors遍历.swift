//
//  _0_marrors遍历.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/22.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension TreeNode {
    /*
     Marrios遍历步骤：
     假设遍历到当前节点是N
     1、如果N.left != null，找到N的前驱节点P
     如果P.right == null： p.right = N; N = N.left; 回到1
     如果P.right == N：P.right = null; 打印N； N = N.right; 回到1；
     2、如果N.left == null：打印N；N = N.right; 回到1；
     3、重复1、2直到 N == null。
     
     */
    func inorder(root: TreeNode?) {
        guard root != nil else{
            return
        }
        
        var node = root
        while node != nil {
            if node!.left != nil {
                //找到前驱节点
                var pred = node?.left
                while pred?.right != nil && pred!.right != node {
                    pred = pred?.right
                }
                
                if pred?.right == nil {
                    pred?.right = node
                    node = node?.left
                }else{
                    print(node!.val)
                    pred?.right = nil
                    node = node?.right
                }
                
            }else{
                print(node!.val)
                node = node?.right
            }
        }
        
    }
}
