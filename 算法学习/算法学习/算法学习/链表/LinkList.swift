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
        let n2 = ListNode(4)
        let n3 = ListNode(3)
        let n4 = ListNode(2)
        let n5 = ListNode(5)
        let n6 = ListNode(2)
        n1.next = n2
        n2.next = n3
        n3.next = n4
        n4.next = n5
        n5.next = n6
        
        print(partition(n1, 3)?.val)
        
    }
}
