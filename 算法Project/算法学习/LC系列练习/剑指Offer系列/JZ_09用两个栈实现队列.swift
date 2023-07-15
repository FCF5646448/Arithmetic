//
//  JZ_09用两个栈实现队列.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/3/2.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension JZ {
    /// 用两个栈来实现队列
    class CQueue {
        var stack0 = [Int]()
        var stack1 = [Int]()
        
        init() {
            
        }
        
        func appendTail(_ value: Int) {
            stack0.append(value)
        }
        
        func deleteHead() -> Int {
            if stack1.count > 0 {
                return stack1.removeLast()
            }else if stack0.count > 0 {
                self.stack1 = self.stack0.reversed()
                return stack1.removeLast()
            }
            return -1
        }
    }
}
