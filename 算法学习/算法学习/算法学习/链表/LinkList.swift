//
//  LinkList.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/15.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

// 链表节点
class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class LinkList {
    func test() {
        let n1 = ListNode(1)
        let n2 = ListNode(2)
        let n3 = ListNode(3)
        let n4 = ListNode(2)
        let n5 = ListNode(1)
        n1.next = n2
//        n2.next = n3
//        n3.next = n4
//        n4.next = n5
        
//        let n = reverseKGroup(n1,3)
//        print(n)
        
        if isPalindrome(n1) == true {
            print("是回文链表")
        }else{
            print("不是回文链表")
        }
    }
}
