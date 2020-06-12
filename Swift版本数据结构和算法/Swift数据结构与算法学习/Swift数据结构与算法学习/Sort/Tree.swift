//
//  Tree.swift
//  Swift数据结构与算法学习
//
//  Created by 冯才凡 on 2020/6/9.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation



public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


class Tree {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
        if root == nil {
            return []
        }
        
        //
        var queue = [TreeNode]()
        queue += [root!]
        var result = [[Int]]()
        var level = 0
        while !queue.isEmpty {
            
            let size = queue.count
            var list:[Int] = []
            for i in 0..<size {
                let tnode = queue.removeFirst()
                list += [tnode.val]
                
                if tnode.left != nil {
                    queue += [tnode.left!]
                }
                
                if tnode.right != nil {
                    queue += [tnode.right!]
                }
            }
            result.append(list)
            
            level += 1
            
        }
        
        return result
        
    }
    
    
    
    func testLevel() {
        let r = TreeNode(3)
        r.left = TreeNode(9)
        r.right = TreeNode(20)
        
        r.right?.left = TreeNode(15)
        r.right?.right = TreeNode(7)
        
        let ru = self.levelOrder(r)
        print(ru)
    }
}
