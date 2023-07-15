//
//  _16.25_LRU_缓存.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/26.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

/*
设计和构建一个“最近最少使用”缓存，该缓存会删除最近最少使用的项目。缓存应该从键映射到值(允许你插入和检索特定键对应的值)，并在初始化时指定最大容量。当缓存被填满时，它应该删除最近最少使用的项目。

它应该支持以下操作： 获取数据 get 和 写入数据 put 。

获取数据 get(key) - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
写入数据 put(key, value) - 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最近最少使用的数据值，从而为新的数据值留出空间。

示例:

LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );

cache.put(1, 1);
cache.put(2, 2);
cache.get(1);       // 返回  1
cache.put(3, 3);    // 该操作会使得密钥 2 作废
cache.get(2);       // 返回 -1 (未找到)
cache.put(4, 4);    // 该操作会使得密钥 1 作废
cache.get(1);       // 返回 -1 (未找到)
cache.get(3);       // 返回  3
cache.get(4);       // 返回  4
通过

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/lru-cache-lcci
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。 */

class LRUCache {
    
    var capacity: Int
    // 字典是以node的key为key进行存储
    var dic = [Int: LRUCacheLinkList.LinkListNode]()
    var link = LRUCacheLinkList()
    
    // 满足hash查找的字典
    private struct CacheElement {
        let key: Int
        let value: Int
    }
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let n = dic[key] else{
            return -1
        }
        // 存在
        link.moveToHead(n)
        
        return n.val
    }
    
    func put(_ key: Int, _ value: Int) {
        
        if link.count == capacity {
            // 已经满了。
            if let n = dic[key] {
                // 如果存在
                n.val = value
                link.moveToHead(n)
            }else{
                // 则先去掉最后一个
                let rmNode = link.removeLast()
                if let rmkey = rmNode?.key {
                    dic[rmkey] = nil
                }
            }
        }
        
        //
        if let n = dic[key] {
            // 如果存在
            n.val = value
            link.moveToHead(n)
        }else{
            // 不存在
            let node = link.add(value, for: key)
            dic[key] = node
        }
        
    }
}

class LRUCacheLinkList {
    class LinkListNode {
        var key: Int
        var val: Int
        var pre: LinkListNode?
        var next: LinkListNode?
        
        init(_ v: Int, for key: Int) {
            self.key = key
            self.val = v
        }
    }
    
    var count: Int = 0
    var head: LinkListNode?
    var tail: LinkListNode?
    
    // 添加元素, 这个元素默认为最近使用
    func add(_ v: Int, for key: Int) -> LinkListNode {
        let node = LinkListNode(v, for: key)
        defer {
            head = node
            count += 1
        }
        
        if head == nil {
            // 说明链表为空
            tail = node
            return node
        }
        
        // 说明有元素，插入头节点
        head?.pre = node
        node.pre = nil
        node.next = head
        
        return node
    }
    
    // 删除最后一个元素
    func removeLast()->LinkListNode? {
        guard let t = tail else {
            return nil
        }
        
        let preN = t.pre
        preN?.next = nil
        tail = preN
        
        if count == 1 {
            head = nil
        }
        
        count -= 1
        
        return t
    }
    
    // 将节点移动到前面
    func moveToHead(_ n:LinkListNode) {
        guard n !== head else {
            return
        }
        
        let preN = n.pre
        let nextN = n.next
        preN?.next = nextN
        nextN?.pre = preN
        n.pre = nil
        
        head?.pre = n
        n.next = head
        
        if n === tail {
            tail = preN
        }
        
        head = n
    }
}
