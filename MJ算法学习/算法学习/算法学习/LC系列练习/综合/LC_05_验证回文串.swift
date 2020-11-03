//
//  LC_05_验证回文串.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/11/4.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC {
    /*
     给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。

     说明：本题中，我们将空字符串定义为有效的回文串。

     示例 1:

     输入: "A man, a plan, a canal: Panama"
     输出: true
     示例 2:

     输入: "race a car"
     输出: false

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xah8k6/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    //
    func isPalindrome(_ s: String) -> Bool {
        let aArr:[Character] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0"]
        
        let newStr = s.lowercased()
        let newArr: [Character] = Array(newStr)
        var left = 0
        var right = newArr.count - 1
        
        while left < right {
            if newArr[left] == newArr[right] {
                left += 1
                right -= 1
            }else if !aArr.contains(newArr[left]) {
                left += 1
            }else if !aArr.contains(newArr[right]) {
                right -= 1
            }else{
                return false
            }
        }
        
        return true
    }
}
