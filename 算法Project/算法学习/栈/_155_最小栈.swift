//
//  _155_最小栈.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/8/24.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

class MinStack {
    var list = [Int]()
    
    init() {
        
    }
    
    func push(_ x: Int) {
        list.append(x)
    }
    
    func pop() {
        list.removeLast()
    }
    
    func top() -> Int {
        guard list.count > 0 else {
            return 0
        }
        return list[list.count - 1]
    }
    
    func getMin() -> Int {
        guard list.count > 0 else {
            return 0
        }
        var min:Int = list.first!
        for i in 1..<list.count {
            min = min > list[i] ?list[i] : min
        }
        return min
    }
    
}
