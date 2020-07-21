//
//  _1143_最长公共子序列.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/21.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension DynamicPrograming {
    /*
     给定两个字符串 text1 和 text2，返回这两个字符串的最长公共子序列的长度。

     一个字符串的 子序列 是指这样一个新的字符串：它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。
     例如，"ace" 是 "abcde" 的子序列，但 "aec" 不是 "abcde" 的子序列。两个字符串的「公共子序列」是这两个字符串所共同拥有的子序列。

     若这两个字符串没有公共子序列，则返回 0。

      

     示例 1:

     输入：text1 = "abcde", text2 = "ace"
     输出：3
     解释：最长公共子序列是 "ace"，它的长度为 3。
     示例 2:

     输入：text1 = "abc", text2 = "abc"
     输出：3
     解释：最长公共子序列是 "abc"，它的长度为 3。
     示例 3:

     输入：text1 = "abc", text2 = "def"
     输出：0
     解释：两个字符串没有公共子序列，返回 0。
      

     提示:

     1 <= text1.length <= 1000
     1 <= text2.length <= 1000
     输入的字符串只含有小写英文字符。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/longest-common-subsequence
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     
     
     解析：
     
     
     */
    
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let nums1 = Array(text1)
        let nums2 = Array(text2)
        
        if nums1.count <= 0 || nums2.count <= 0 {
            return 0
        }
        return lcs(nums1, nums1.count, nums2, nums2.count)
    }
    
    func lcs(_ nums1:[Character], _ i:Int, _ nums2:[Character], _ j:Int) -> Int {
        if i == 0 || j == 0 {
            return 0
        }
        
        if nums1[i - 1] == nums2[j - 1] {
            return lcs(nums1, i - 1, nums2, j - 1) + 1
        }
        return max(lcs(nums1, i - 1, nums2, j), lcs(nums1, i, nums2, j - 1))
    }
}
