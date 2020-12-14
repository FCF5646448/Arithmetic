//
//  _94_二叉树的中序遍历.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/1.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension TreeNode {
    /*
     迭代
     
     */
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        
        var result = [Int]()
        var stack = [TreeNode]()
        var n = root
        
        while !stack.isEmpty || n != nil {
            if n != nil {
                stack.append(n!)
                n = n!.left
            }else{
                n = stack.removeLast()
                result += [n!.val]
                n = n!.right
            }
        }
        
        return result
    }
}
