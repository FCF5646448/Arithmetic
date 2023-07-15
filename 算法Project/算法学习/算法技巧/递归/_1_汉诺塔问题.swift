//
//  _1_汉诺塔问题.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/8.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Recursion {
    /*
     三根柱子，A、B、C。A中有从上往下的1、2、3..n个面积递增的盘子。
     要求: 每次只能移动一个盆子，且每根柱子上的盘子，编号大的必须在下面。
     求移动的过程。
     解析：
     n个碟子，然后设置3根柱子。三根柱子中总有一根要作为中间柱子来用，也就是temp，然后下面函数就表示将n个盘子从from移动到target中。
     递归思路：分解问题。
     假设有3根部分编号的柱子，要把n个盘子从第0根柱子移到第3根柱子，那么就得先把n-1个盘子移到第二个柱子，然后将第n个盘子移到到第三根柱子，再把n-1个盘子移动到第三个柱子。这样就基本把大问题分解成了小问题。
     查找边界值：最小的问题，无疑就是只有1个盘子的情况，则直接将盘子移过去。而大于1个盘子的情况，则都得得借助中间柱子的过程。
     
     * from：起始柱子
     * temp：临时柱子
     * target：目标柱子
     */
    func hanoi(_ n:Int, _ from:String, _ temp:String, _ target:String) {
        if n == 1 {
            move(n, from, target)
            return
        }
        //先将n-1个盘子从开始柱子移动到临时柱子。移动的过程中要借助目标柱子来充当临时辅助。
        hanoi(n-1, from, target, temp)
        //移动
        move(n, from, target)
        //将临时柱子里的盘子，移到目标柱子。移动的过程中要借助开始柱子作为临时辅助
        hanoi(n-1, temp, from, target)
        
        
    }
    
    func move(_ n:Int, _ from:String, _ to:String) {
        print("将\(n)号盘子从\(from)移动到\(to)")
    }
    
    
    
    
    
}
