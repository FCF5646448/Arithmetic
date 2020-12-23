//
//  _99_恢复二叉搜索树.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/20.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension TreeNode {
    /*
     给你二叉搜索树的根节点 root ，该树中的两个节点被错误地交换。请在不改变其结构的情况下，恢复这棵树。
     
     进阶：使用 O(n) 空间复杂度的解法很容易实现。你能想出一个只使用常数空间的解决方案吗？
     
     
     输入：root = [1,3,null,null,2]
     输出：[3,1,null,null,2]
     解释：3 不能是 1 左孩子，因为 3 > 1 。交换 1 和 3 使二叉搜索树有效。
     
     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/recover-binary-search-tree
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    /*
     二叉搜索树的特点：中序遍历结果是升序的
     所以，如果有错误的节点情况,则至少会存在一个逆序对。
     两个中序遍历中相邻节点的话，只有一个逆序对；
     两个中序遍历中不相邻节点的话，会存在两个逆序对；
     
     所以要恢复的话，只需要处理这些逆序对的情况
     1、如果只有一个逆序对，则直接交换两个节点的值；
     2、如果有两个逆序对的话，将两个逆序对对最小的值与两个逆序对中最大的值交换位置即可
     */
    
    class recoverTree {
        // 逆序对中，前一个节点
        var preNode: TreeNode?
        // 第一个错误节点
        var first: TreeNode?
        // 第二个错误节点
        var second: TreeNode?
        
        
        func recoverTree(_ root: TreeNode?) {
            midTree(root)
            if first != nil && second != nil {
                // 交换两个错误节点
                let temp = first!.val
                first!.val = second!.val
                second!.val = temp
            }
            
        }
        
        func midTree(_ root: TreeNode?) {
            guard root != nil else {
                return
            }
            midTree(root!.left)
            
            find(root!)
            
            midTree(root!.right)
            
        }
        
        //方法二
        func recoverTree2(_ root: TreeNode?) {
            guard root != nil else {
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
                        find(node!)
                        pred?.right = nil
                        node = node?.right
                    }
                    
                }else{
                    find(node!)
                    node = node?.right
                }
            }
            
            if first != nil && second != nil {
                // 交换两个错误节点
                let temp = first!.val
                first!.val = second!.val
                second!.val = temp
            }
            
        }
        
        private func find(_ root: TreeNode?) {
            guard root != nil else {
                return
            }
            // 出现了逆序对
            if preNode != nil && preNode!.val > root!.val {
                //第二个错误节点：第二个逆序对中较小的那个节点
                second = root
                
                // 第一个错误节点：第一个逆序对中较大的那个节点
                if first != nil {
                    return
                }
                first = preNode
            }
            
            preNode = root
        }
        
        
    }
}
