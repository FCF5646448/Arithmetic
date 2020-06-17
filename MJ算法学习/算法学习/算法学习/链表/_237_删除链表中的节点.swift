//
//  _237_删除链表中的节点.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/15.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension ListNode {
    //注意这个方法 不是使用遍历
    /*
     条件很重要：
     链表至少包含两个节点。
     链表中所有节点的值都是唯一的。
     给定的节点为非末尾节点并且一定是链表中的一个有效节点。
     不要从你的函数中返回任何结果。
     */
    func deleteNode(_ node: ListNode?) {
        node?.val = node?.next?.val ?? 0
        node?.next = node?.next?.next
    }
}
