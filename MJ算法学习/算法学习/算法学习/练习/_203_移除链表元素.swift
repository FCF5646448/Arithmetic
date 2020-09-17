//
//  _203_移除链表元素.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/9/17.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LinkList {
    /*
     删除链表中等于给定值 val 的所有节点。

     示例:

     输入: 1->2->6->3->4->5->6, val = 6
     输出: 1->2->3->4->5
     */
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else {
            return nil
        }
        let dummy = ListNode(0)
        dummy.next = head
        var tail = dummy
        var h = head
        while h != nil {
            if h!.val == val {
                tail.next = h?.next
            }else{
                tail = tail.next!
            }
            
            h = h!.next
        }
        
        return dummy.next
    }
    
    func removeElements2(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else {
            return nil
        }
        var newHead: ListNode? = nil
        var tail: ListNode? = nil
        var h = head
        while h != nil {
            if h!.val != val {
                // 处理不等于的值
                if newHead == nil {
                    newHead = h
                    tail = h
                }else{
                    tail!.next = h
                    tail = h
                }
            }
            h = h!.next
        }
        // 注意这句
        tail?.next = nil
        return newHead
    }
}
