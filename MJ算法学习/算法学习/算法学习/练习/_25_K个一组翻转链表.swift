//
//  _25_K个一组翻转链表.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/19.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

/*
 25. K 个一组翻转链表
 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。

 k 是一个正整数，它的值小于或等于链表的长度。

 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

  

 示例：

 给你这个链表：1->2->3->4->5

 当 k = 2 时，应当返回: 2->1->4->3->5

 当 k = 3 时，应当返回: 3->2->1->4->5

  

 说明：

 你的算法只能使用常数的额外空间。
 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
 */

extension LinkList {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || k < 2{
            return head
        }
        
        var node: ListNode? = head
        let newHead = ListNode(0)
        var preNode:ListNode = newHead
        
        while node != nil {
            
            var dummy : ListNode? = nil
            var i = 0
            while i < k && node != nil {
                let temp = node!.next
                node!.next = dummy
                dummy = node
                node = temp
                i += 1
            }
            if i < k {
                //最后剩余不足k,则将dummy重新翻转过来
                var dummy1 : ListNode? = nil
                var n2 = dummy
                while n2 != nil {
                    let temp = n2!.next
                    n2!.next = dummy1
                    dummy1 = n2
                    n2 = temp
                }
                preNode.next = dummy1
            }else{
                //接上后续链表
                preNode.next = dummy
                while preNode.next != nil {
                    preNode = preNode.next!
                }
            }
            
            
        }
        
        return newHead.next
        
    }
}

