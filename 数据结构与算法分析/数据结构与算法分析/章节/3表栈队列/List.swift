//
//  List.swift
//  数据结构与算法分析
//
//  Created by 冯才凡 on 2023/7/15.
//

import Foundation

protocol ListProtocol {
    associatedtype NodeType
    var isEmpty: Bool { get }
    /// 打印列表
    func printList()
    /// 置空
    func makeEmpty()
    /// 在index位置插入元素
    func insert(_ node: NodeType, in index: Int)
    /// 删除元素
    func delete(_ node: NodeType)
    /// 查找元素，返回下标
    func find(_ node: NodeType) -> Int?
}


/// 这里，这里不能使用struct，因为struct不能递归包含循环的结构体属性
class Node<T> {
    var val: T
    var next: Node<T>?
    
    init(val: T, next: Node<T>? = nil) {
        self.val = val
        self.next = next
    }
}
