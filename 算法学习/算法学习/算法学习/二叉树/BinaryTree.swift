//
//  BinaryTree.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/16.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

class TreeNode: Equatable {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right && lhs.val == rhs.val
    }
}


class BinaryTree {
    func test(){
        
    }
}
