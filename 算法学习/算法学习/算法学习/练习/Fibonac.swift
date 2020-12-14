//
//  Fibonac.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/15.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

// 1、2、3、5、8、13、21、34、55、89...
class Fib {
    
    func test() {
        print(getFib2(64))
    }
    
    /*
     递归的复杂度更高,会卡死
     O(2^n)
     */
    func getFib(_ n:Int) -> Int {
        if n <= 1 {
            return n
        }
        return getFib(n - 1) + getFib(n - 2)
    }
    
    
    /*
     非递归
     0、1、2、3、4、5、6、7、 8、 9 ...
     0、1、1、2、3、5、8、13、21、34、55、89 ...
     O(n)
     */
    func getFib2(_ n:Int) -> Int {
        if n <= 1 {return n}
        
        var first = 0
        var second = 1
        var sum = 0
        for _ in 0..<n-1 {
            sum  = first + second
            first = second
            second = sum
        }
        
        return second
    }
    
}
