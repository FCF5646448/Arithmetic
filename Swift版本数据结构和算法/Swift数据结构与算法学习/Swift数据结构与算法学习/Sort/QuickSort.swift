//
//  QuickSort.swift
//  Swift数据结构与算法学习
//
//  Created by 冯才凡 on 2019/12/3.
//  Copyright © 2019 冯才凡. All rights reserved.
//

import Foundation

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
}

class Solution {
    func testQuickSort() {
        let n4 = ListNode(4)
        let n2 = ListNode(2)
        let n1 = ListNode(1)
        let n3 = ListNode(3)
        
        n4.next = n2
        n2.next = n1
        n1.next = n3
        
        var new = sortList(n4)
        while new != nil {
            print(new!.val)
            new = new!.next
        }
    }
    
    func sortList(_ head: ListNode?) -> ListNode? {
        
        func quick(_ head:ListNode?, _ end:ListNode?) {
            if head == nil {
                return
            }
            if head?.val != end?.val {
                let qNode:ListNode?  = quickSort(head)
                quick(head, qNode)
                quick(qNode?.next, end)
            }
        }

        func quickSort(_ head:ListNode?)->ListNode? {
            if head == nil {
                return head
            }
            var slow:ListNode? = head
            var fast:ListNode? = head!.next
            while fast != nil {
                if fast!.val < head!.val {
                    slow = slow!.next
                    let tmp = slow!.val
                    slow!.val = fast!.val
                    fast!.val = tmp
                }
                fast = fast!.next
            }

            let temp = slow!.val
            slow!.val = head!.val
            head!.val = temp
            return slow
        }

        quick(head,nil)
        return head
    }
}
