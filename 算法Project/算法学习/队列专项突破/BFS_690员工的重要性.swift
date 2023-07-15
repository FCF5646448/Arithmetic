//
//  BFS_690员工的重要性.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/4/15.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension Queue {
    /*
     给定一个保存员工信息的数据结构，它包含了员工 唯一的 id ，重要度 和 直系下属的 id 。

     比如，员工 1 是员工 2 的领导，员工 2 是员工 3 的领导。他们相应的重要度为 15 , 10 , 5 。那么员工 1 的数据结构是 [1, 15, [2]] ，员工 2的 数据结构是 [2, 10, [3]] ，员工 3 的数据结构是 [3, 5, []] 。注意虽然员工 3 也是员工 1 的一个下属，但是由于 并不是直系 下属，因此没有体现在员工 1 的数据结构中。

     现在输入一个公司的所有员工信息，以及单个员工 id ，返回这个员工和他所有下属的重要度之和。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/employee-importance
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    public class Employee {
         public var id: Int
         public var importance: Int
         public var subordinates: [Int]
         public init(_ id: Int, _ importance: Int, _ subordinates: [Int]) {
             self.id = id
             self.importance = importance
             self.subordinates = subordinates
         }
    }
    
    func getImportance(_ employees: [Employee], _ id: Int) -> Int {
        guard employees.count > 0 else{
            return 0
        }
        var queue = [Employee]()
        var importance = 0
        for emp in employees {
            if emp.id == id {
                queue.append(emp)
                importance += emp.importance
                break
            }
        }
        
        while !queue.isEmpty {
            let firstSub = queue.removeFirst()
            for id in firstSub.subordinates {
                if let emp = employees.first(where: { $0.id == id}) {
                    importance += emp.importance
                    queue.append(emp)
                }
                
            }
        }
        return importance
    }
    
}
