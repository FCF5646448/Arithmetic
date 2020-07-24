//
//  _36_有效的数独.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/23.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

class Sudoku {
    /*
     判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。

     数字 1-9 在每一行只能出现一次。
     数字 1-9 在每一列只能出现一次。
     数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。


     上图是一个部分填充的有效的数独。

     数独部分空格内已填入了数字，空白格用 '.' 表示。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/valid-sudoku
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     
     
     解析：这道题是验证已经存在的数字是否有效。不是要去做数独。所以只需要遍历，查找是否存在相同的已有数据就可以了。
     
     0,0         0,0
     1,0         0,3
     1,4         1,4
     2,1         0,7
     2,7         2,7
     6,7         8,1
     
     3,4         4,1
     
     
     总结出的小标小公式——第n个小9宫格里的第k位：
     n = i/3 * 3 + j/3
     k = i%3 * 3 + j%3
     
     
     */
    
    
    //肯定要是有hashmap来做
    //最里层用来存每个小9宫格数据。 不存在就某人为0
    var nArr = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    //表示某个数存在于某一行
    var rowColArr = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for i in 0..<board.count {
            let cArr = board[i]
            
            for j in 0..<cArr.count {
                let c = cArr[j]
                if let n = c.wholeNumberValue {
                    if !isValid(i,j,n) {
                        print("\(i)行\(j)列无效")
                        return false
                    }
                    nArr[i/3 * 3 + j/3][i%3 * 3 + j%3] = n
                    rowColArr[i][j] = n
                }
            }
        }
        
        return true
    }
    
    //是否同一行出现过，是否同一列出现过，是否同一个小九宫格出现过
    func isValid(_ i:Int, _ j:Int,_ n:Int) -> Bool {

        //不要同一列
        for ti in 0..<i {
            let tn = rowColArr[ti][j]
            if tn > 0 && tn == n {
                return false
            }
        }
        //不要同一行
        for col in 0..<j {
            let tn = rowColArr[i][col]
            if tn > 0 && tn == n {
                return false
            }
        }
        
        //不要同一小9宫格
        let currentI = i/3 * 3 + j/3
        let litterArr = nArr[currentI]
        let currentJ = i%3 * 3 + j%3
        for k in 0..<currentJ {
            let tn = litterArr[k]
            if tn > 0 && tn == n {
                return false
            }
        }
        
        return true
    }
    
}
