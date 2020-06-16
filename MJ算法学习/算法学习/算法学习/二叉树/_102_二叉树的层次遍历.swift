//
//  _102_二叉树的层次遍历.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/16.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

//两种层级遍历方法
extension BinaryTree {
    func levelOrder1(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        
        var queue = [TreeNode]()
        queue += [root!]
        
        var result = [[Int]]()
        while !queue.isEmpty {
            
            var level = [Int]()
            let count = queue.count
            for _ in 0..<count {
                let node = queue.removeFirst()
                level += [node.val]
                
                if node.left != nil {
                    queue += [node.left!]
                }
                
                if node.right != nil {
                    queue += [node.right!]
                }
                
            }
            
            result += [level]
        }
        return result
    }
    
    func levelOrder2(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var queue = [TreeNode]()
        queue += [root!]
        
        var result = [[Int]]()
        var level = 1
        var levels = [Int]()

        while !queue.isEmpty {
            let node = queue.removeFirst()
            levels += [node.val]
            level -= 1

            if node.left != nil {
                queue += [node.left!]
            }
                
            if node.right != nil {
                queue += [node.right!]
            }

            if level == 0 {
                //一层结束
                level = queue.count
                result += [levels]
                levels = []
            }
        }

        return result
    }
    
}
