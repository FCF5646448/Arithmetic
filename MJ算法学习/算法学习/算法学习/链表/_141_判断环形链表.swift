//
//  _141_判断环形链表.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/15.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LinkList {
    /*
     给定一个链表，判断链表中是否有环。
     这里要注意fast与slow一开始不应该指向一个结点。不然一开始就相遇；
     然后判断要放后面，因为一进来肯定是不相等的，得让它们先走一步再进行判断；
    */
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head!.next == nil {
            return false
        }
        
        var slow = head
        var fast = head!.next
        while fast != nil && fast!.next != nil {
            fast = fast?.next?.next
            slow = slow!.next
            
            if fast === slow {
                return true
            }
        }
        
        return false
    }
}
