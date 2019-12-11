import UIKit

var str = "Hello, playground"

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var allR:[[Int]] = []
        var result = [Int](repeating: 0, count: nums.count)
        var book:[Int:Int] = [:]

        //初始化标记位为0（未使用过）
        for item in nums {
            book[item] = 0;
        }
        
        func def(_ step:Int) {
            if step == nums.count {
                allR.append(result)
                return
            }

            for item in nums {
                //遍历所有可能性
                if book[item] == 0 {
                    //未使用过, 加入进来
                    result[step] = item
                    //标记已使用
                    book[item] = 1
                    //下一步
                    def(step+1)
                    //回溯
                    book[item] = 0
                }
            }
        }

        def(0)
        print(allR)
        return allR
    }
}

Solution().permute([1,2,3])
