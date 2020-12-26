//
//  LRU.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/26.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


// https://www.jianshu.com/p/ef99e5d5a408

// 链表

fileprivate typealias DoubleLinkListNode<T> = DoubleLinkList<T>.Node<T>

fileprivate class DoubleLinkList<T> {
    // 节点
    class Node<T> {
        var val: T
        var pre: Node<T>?
        var next: Node<T>?
        init(_ v: T) {
            self.val = v
        }
    }
    
    // 存储量
    var limit: Int = 0
    // 当前节点数量
    var count: Int = 0
    // 头节点
    var head: Node<T>?
    // 尾节点
    var tail: Node<T>?
    
    // 向链表里添加新元素(直接传入值)，这个元素就是最近使用的元素
    func addHead(_ n: T) -> Node<T> {
        let node = Node(n)
        defer {
            head = node
            count += 1
        }
        guard let h = head  else {
            // 说明没有元素，当做第一个元素使用
            tail = node
            return node
        }
        // 已经存在元素，则把新节点插入头部
        h.pre = node
        node.pre = nil
        node.next = h
        return node
    }
    
    // 将链表里存在的节点，移动到头部
    func moveToHead(_ node: Node<T>) {
        guard node !== head else {return}
        
        let preN = node.pre
        let nextN = node.next
        
        //先将节点剥离出来
        preN?.next = nextN
        nextN?.pre = preN
        // 将节点插入到头部
        node.next = head
        node.pre = nil
        

        if node === tail {
            // 重置尾节点
            tail = preN
        }
        
        self.head = node
    }
    
    // 当容量已满时，需要移除最近最久未使用的元素, 返回移除的节点
    func removaLast() -> Node<T>? {
        guard let t = self.tail else {
            return nil
        }
        
        let preN = tail?.pre
        preN?.next = nil
        self.tail = preN
        
        if count == 1 {
            head = nil
        }
        
        count -= 1
        
        return t
    }
    
}

class CacheLRU<Key: Hashable, Value> {
    // 满足hash查找的字典
    private struct CacheElement {
        let key: Key
        let value: Value
    }
    
    // 存储 CacheDic
    private let list = DoubleLinkList<CacheElement>()
    // 存储所有节点的字典
    private var nodeDic = [Key : DoubleLinkListNode<CacheElement>]()
    // 容量
    private let capacity: Int
    
    init(_ capacity: Int) {
        self.capacity = max(0, capacity)
    }
    
    // 添加元素
    func put(_ value: Value, for key: Key) {
        let n = CacheElement(key: key, value: value)
        
        // 添加
        if let node = nodeDic[key] {
            node.val = n
            list.moveToHead(node)
        }else {
            let node = list.addHead(n)
            nodeDic[key] = node
        }
        
        // 处理超容量的问题
        if list.count > capacity {
            let nodeRemoved = list.removaLast()
            if let key = nodeRemoved?.val.key {
                nodeDic[key] = nil
            }
        }
    }
    
    // 获取元素
    func getValue(for key: Key) -> Value? {
        guard let node = nodeDic[key] else {
            return nil
        }
        list.moveToHead(node)
        
        return node.val.value
    }
    
}

