//
//  DFS.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/23.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

/*
 深度优先遍历
 凡是排列组合相关的问题，基本都可以使用DFS来做
 
 从上往下一层一层组合
 
 */
class DFS {
    var letter: [[Character]] = [["a","b","c"],["d","e","f"],["g","h","i"],["j","k","l"],["m","n","o"],["p","q","r","s"],["t","u","v"],["w","x","y","z"]]
    
    func test() {
        print(permute([1,2,3]))
    }
}
