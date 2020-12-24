//
//  DFS.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/23.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

/*
 总结
 深度优先遍历
 凡是【排列组合】相关的问题，基本都可以使用DFS来做
 
 从上往下一层一层组合
 
 关键点：
 1、每一层的含义是什么，每一层所能做的选择是什么
 2、如果选择比较多，就可以使用for循环，如果选择不多或者是平行关系。则直接列举。
 
 */
class DFS {
    var letter: [[Character]] = [["a","b","c"],["d","e","f"],["g","h","i"],["j","k","l"],["m","n","o"],["p","q","r","s"],["t","u","v"],["w","x","y","z"]]
    
    func test() {
//        print(permuteUnique([1,1,2]))
//        print(generateParenthesis(3))
        
        let root = TreeNode(5)
        let l1 = TreeNode(4)
        let r1 = TreeNode(8)
        root.left = l1
        root.right = r1
        let l2 = TreeNode(11)
        l1.left = l2
        let l2l = TreeNode(13)
        let l2r = TreeNode(4)
        r1.left = l2l
        r1.right = l2r
        
        let l3l = TreeNode(7)
        let l3r = TreeNode(2)
        l2.left = l3l
        l2.right = l3r
        let r3l = TreeNode(5)
        let r3r = TreeNode(1)
        l2r.left = r3l
        l2r.right = r3r
        
        print(pathSum(root, 22))
    }
}
