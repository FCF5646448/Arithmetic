import UIKit

/*给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    //这个方法使用swift api：firstIndex 估计会更耗时一些，内部可能还有循环
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            let first = nums[i]
            if let index = nums.firstIndex(of: (target-first)), i != index {
                //存在
                return [i,index]
            }
        }
        return []
    }
    
    //这个方法的技巧在意，先标记，然后在以标记的数据当中查找。回头望月
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var dic:[Int:Int] = [:] //存值和对应的下标
        for (i,value) in nums.enumerated() {
            if let index = dic[target - value] {
                return [index,i]
            }
            dic[value] = i
        }
        return []
    }
}

let result = Solution().twoSum2([2,7,11,15], 18)





