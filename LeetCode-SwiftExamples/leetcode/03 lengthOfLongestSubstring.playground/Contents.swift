import UIKit

//窗口滚动算法的核心就是对每一个元素设置一个标记
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var dic:[Character:Int] = [:] //n每个字符对应的状态，默认为-1
        var start = -1
        var size = 0
        for (index,char) in s.enumerated() {
            print(char,index)
            if let value = dic[char], value > start{ //value > start这个判断条件最憋屈
                //说明已经读到过
                start = value
            }
            dic[char] = index //表示已读过
            size = max(size, index - start)
        }
        
        return size
    }
}

let s = 0 - -1

let result = Solution().lengthOfLongestSubstring("abba")










