//
//  JZ_06从尾到头打印链表.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/2/26.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation
class JZ_LinkNode {
    public var val: Int
    public var next: JZ_LinkNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


extension JZ {
    /*
     从尾到头打印链表
     */
    
    /*
     解析：
     因为链表没有索引，所以打印某一个元素，一定是先从头遍历到该元素。
     如果是从头到尾打印，则遍历顺序正好是打印顺序。如果从尾到头打印，那么就正好和栈的先进后出的特性相符。
     所以，遍历的时候先入栈，最后出栈打印。
     */
    
    func reversePrint(_ head: JZ_LinkNode?) -> [Int] {
        var stack = [Int]()
        
        var p = head
        while p != nil {
            stack.append(p!.val)
            p = p?.next
        }
        
        return stack.reversed()
    }
    
    /*
     方法2：栈的使用正好也是递归，所以这道题又可以使用递归来做
     */
    func reversePrint2(_ head: JZ_LinkNode?) {
        if head != nil {
            if head!.next != nil {
                reversePrint2(head!.next)
            }
            print(head!.val)
        }
    }
}
