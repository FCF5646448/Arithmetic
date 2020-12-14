//
//  _0_回文链表.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/8/18.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LinkList{
    /*
     请判断一个链表是否为回文链表。
     方法：
     1、找到中间节点
     2、反转后面链表
     3、判断是否回文链表
     */
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard head != nil else {
            return false
        }
        
        var mid = findMid(head)?.next
        mid = reverseList3(mid)
        
        var leftH = head
        
        while mid != nil {
            if leftH!.val != mid!.val {
                return false
            }
            mid = mid?.next
            leftH = leftH?.next
        }
        
        
        return true
    }
    
    /*
     查找中间节点,中间节点的下一个节点就是要进行反转的头结点
     使用快慢指针的方法查找中间节点
     我们发现
     当链表个数为奇数的时：fast.next == nil，slow就是中间节点
     当链表个数为偶数的时：fast.next.next == nil，slow就是中间节点
     */
    func findMid(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return head
        }
        var fast = head
        var slow = head
        while fast!.next != nil && fast!.next!.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
    
    /*
     反转链表，使用非递归的方式
     第一步，head的next就==nil了。
     
     */
    func reverseList3(_ head: ListNode?) -> ListNode? {
        var newH: ListNode? = nil
        var p = head
        while p != nil {
            let tmp = p!.next
            p!.next = newH
            newH = p
            p = tmp
        }
        return newH
    }
    
}
