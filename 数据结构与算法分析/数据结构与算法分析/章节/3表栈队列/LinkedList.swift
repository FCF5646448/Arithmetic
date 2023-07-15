//
//  LinkedList.swift
//  数据结构与算法分析
//
//  Created by 冯才凡 on 2023/7/15.
//

import Foundation

class LinkedList: ListProtocol {
    typealias NodeType = Node<Int>
    var head: NodeType = NodeType(val: -1) // 链表头
    
    var isEmpty: Bool { return head.next == nil }
    /// 打印列表
    func printList() {
        
    }
    /// 置空
    func makeEmpty() {
        
    }
    /// 在index位置插入元素
    func insert(_ node: NodeType, in index: Int) {
        
    }
    /// 删除元素
    func delete(_ node: NodeType) {
        
    }
    /// 查找元素，返回下标
    func find(_ node: NodeType) -> Int? {
        return nil
    }
}
