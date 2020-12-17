//
//  _LC3_设计循环队列.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/18.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation
extension LC3 {
    class MyCircularQueue {
        var queue:[Int]!
        var head = -1
        var tail = -1
        init(_ k: Int) {
            queue = Array(repeating: 0, count: k)
        }
        
        //元素入队，放在尾下标的位置
        func enQueue(_ value: Int) -> Bool {
            // 尾下标先往后移
            tail += 1
            if tail < queue.count {
                // 如果正好碰到头节点，说明没法插入
                if head == tail {
                    tail -= 1
                    return false
                }else{
                    // 插入，如果是第一次，修改头下标的位置
                    queue[tail] = value
                    if head == -1 {
                        head = 0
                    }
                    return true
                }
            }else if head > 0{
                // 头部有空位
                tail = 0
                queue[tail] = value
                return true
            }else{
                tail -= 1
                return false
            }
        }
        
        // head下标出队，出队后，更新头结点位置
        func deQueue() -> Bool {
            if head == -1 {
                // 没有元素
                return false
            }
            if head == tail {
                // 只有一个元素，首尾是同一个元素
                head = -1
                tail = -1
                return true
            }

            head += 1
            if head >= queue.count {
                head = 0
            }
            return true
        }
        
        func Front() -> Int {
            if head != -1 {
                return queue[head]
            }
            return -1
        }
        
        func Rear() -> Int {
            if tail != -1 {
                return queue[tail]
            }
            return -1
        }
        
        func isEmpty() -> Bool {
            if head == -1 && tail == -1 {
                return true
            }else{
                return false
            }
        }
        
        func isFull() -> Bool {
            if (tail == queue.count - 1 && head == 0) || (head - tail == 1){
                return true
            }else{
                return false
            }
        }
    }

}
