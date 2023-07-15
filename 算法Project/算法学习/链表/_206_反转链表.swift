//
//  _206_反转链表.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/15.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension LinkList {
    //你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
    
    //递归
    func reverseList1(_ head: ListNode?) -> ListNode? {
        if head == nil || head!.next == nil {
            return head
        }
        
        let newHead = reverseList1(head?.next)
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
    
    
    //注意这个技巧
    func reverseList2(_ head: ListNode?) -> ListNode? {
        //注意newHead为nil，相当于让第一个节点的next指针就指向了nil
        var newHead:ListNode? = nil
        var p: ListNode? = head
        while p != nil {
            let temp = p!.next
            p!.next = newHead
            newHead = p
            p = temp
        }
        
        return newHead
    }
}
