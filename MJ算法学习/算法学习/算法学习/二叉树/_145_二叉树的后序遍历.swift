//
//  _145_二叉树的后序遍历.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/1.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension TreeNode  {
    /*
     后序遍历，需要借助一个临时变量存之前那个节点
     */
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else{
            return []
        }
        
        var result = [Int]()
        var stack = [TreeNode]()
        var n = root
        var lastVisited = root
        
        while !stack.isEmpty || n != nil {
            while n != nil {
                stack.append(n!)
                n = n!.left
            }
            
            n = stack.last
            /*
             如果右节点为空，则当前节点是叶子节点
             如果右节点是已访问过的节点，那么当前节点是中节点，正好就结束了左右中的一个小树。
             */
            if n!.right == nil || n!.right === lastVisited {
                result += [n!.val]
                stack.removeLast()
                lastVisited = n
                n = nil
            }else{
                //设为右节点，然后将右节点入栈。
                n = n!.right
            }
        }
        
        return result
    }
}
