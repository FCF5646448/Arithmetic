//
//  _7_整数反转.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/28.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension HF {
    /*
     7. 整数反转
     给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

     示例 1:

     输入: 123
     输出: 321
     */
    
    /*
     
     */
    func reverse(_ x: Int) -> Int {
        
        var n = x
        var res = 0
        while n != 0 {
            let preRes = res
            res = preRes * 10 + n%10
            
            // 处理溢出
            if ((res - n%10) / 10 != preRes) { return 0}
            
            n /= 10
        }
        
        return res
    }
}
