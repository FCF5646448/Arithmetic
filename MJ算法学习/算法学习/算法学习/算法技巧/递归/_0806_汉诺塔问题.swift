//
//  _0806_汉诺塔问题.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/8.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension Recursion {
    
    /*
     在经典汉诺塔问题中，有 3 根柱子及 N 个不同大小的穿孔圆盘，盘子可以滑入任意一根柱子。一开始，所有盘子自上而下按升序依次套在第一根柱子上(即每一个盘子只能放在更大的盘子上面)。移动圆盘时受到以下限制:
     (1) 每次只能移动一个盘子;
     (2) 盘子只能从柱子顶端滑出移到下一根柱子;
     (3) 盘子只能叠在比它大的盘子上。

     请编写程序，用栈将所有盘子从第一根柱子移到最后一根柱子。

     你需要原地修改栈。

     示例1:

      输入：A = [2, 1, 0], B = [], C = []
      输出：C = [2, 1, 0]
     示例2:

      输入：A = [1, 0], B = [], C = []
      输出：C = [1, 0]
     提示:

     A中盘子的数目不大于14个。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/hanota-lcci
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    func hanota(_ A: [Int], _ B: [Int], _ C: [Int]) {
        if A.count == 1 {
            hanota([], [], A)
            return
        }
        
//        //先把A的[0...n-1]个元素移动到B
//        let temp:[Int] = A[..<(A.count - 2)] as! [Int]
//        hanota([A.count - 1], temp, [])
//        //
//        hanota([], [], [A.count - 1])
//        //
//        hanota(<#T##A: [Int]##[Int]#>, <#T##B: [Int]##[Int]#>, <#T##C: [Int]##[Int]#>)
        
    }
}

