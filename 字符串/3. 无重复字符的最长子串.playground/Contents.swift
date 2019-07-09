import UIKit

/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 
 示例 1:
 
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var set:[Character] = [] //Set<Character> = []
        var maxSubCount:Int = 0
        var start:Int = 0
        var end:Int = 0
        
        var i = 0, j = 0
        while i < s.count && j < s.count {
            //不存在 窗口向右扩大
            let c = s[s.index(s.startIndex, offsetBy: j)]
            if !set.contains(c) {
                set.append(c)
                j += 1 //向右扩1格
                if maxSubCount < j-i {
                    maxSubCount = j-i
                    start = i
                    end = j
                }
                
            }else{
                // 若找到，左侧向右移一格
                set.remove(at: 0)
                i += 1
            }
        }
        print("max:\(maxSubCount),start:\(start),end:\(end)")
        return maxSubCount
    }
    
    
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        var longest = 0, left = 0, set = Set<Character>()
        let sChars = Array(s)
        for (i,char) in sChars.enumerated() {
            if set.contains(char) {
                //存在
                longest = max(longest, i-left)
                while sChars[left] != char {
                    // 将窗口左侧移到 与当前 字符相同字符的位置
                    set.remove(sChars[left])
                    left += 1
                }
                left += 1
            }else{
                set.insert(char)
            }
        }
        if longest < set.count {
            // 处理单个字符的情况
            return set.count
        }
        return longest
    }
}

let result = Solution().lengthOfLongestSubstring2("pwwkew")


