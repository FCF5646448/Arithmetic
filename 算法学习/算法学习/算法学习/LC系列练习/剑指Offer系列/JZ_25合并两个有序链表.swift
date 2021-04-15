//
//  JZ_25合并两个有序链表.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/3/22.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension JZ {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var cur = dummy
        var p1 = l1
        var p2 = l2
        while p1 != nil || p2 != nil {
            if p1 != nil && p2 != nil {
                if p1!.val <= p2!.val {
                    cur.next = p1
                    p1 = p1!.next
                }else{
                    cur.next = p2
                    p2 = p2!.next
                }
            }else if p1 != nil {
                cur.next = p1
                p1 = p1!.next
            }else{
                cur.next = p2
                p2 = p2!.next
            }
            cur = cur.next!
        }
        return dummy.next
    }
}
