import UIKit

class Solution {
    func isPalindromicStr(_ s:String)-> Bool {
        if s.count == 1 {
            return true
        }
        let mid = (s.count+1)/2
        for i in 0..<mid {
            if i > (s.count - 1 - i) {
                break
            }
            let firstStr = s[s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: i+1)]
            print("first:\(firstStr)")
            let secondStr = s[s.index(s.startIndex, offsetBy:(s.count - 1 - i))..<s.index(s.startIndex, offsetBy: (s.count - 1 - i)+1)]
            print("second:\(secondStr)")
            if firstStr != secondStr {
                return false
            }
        }
        return true
    }
    
    func longestPalindrome(_ s: String) -> String {
        if s.count > 1000 {
            return ""
        }
        if s.count < 2 {
            return s
        }
        var length = 1 //最短子串从长度为2开始
        var i = 0
        var subStrArr:[String] = [] //存放最长子串的数组
        var maxLongestIndex = 0 //最长子串所在数组的下标
        while (i<s.count-1 && (i+length)<=s.count) {
            
            let subStr = s[s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: i+length)]
            print("sub:\(subStr)")
            if self.isPalindromicStr(String(subStr)) {
                //是回文字符串
                print("xxxxxx")
                subStrArr.append(String(subStr))
                print("arr:\(subStrArr)")
                if let longStr:String = subStrArr[maxLongestIndex], longStr.count <= subStr.count {
                    maxLongestIndex = subStrArr.count-1
                }
            }
            
            length += 1
            if (i+length) > s.count {
                //da
                i += 1
                length = 1
            }
        }
        if (subStrArr.count > 0) && (maxLongestIndex <= subStrArr.count-1)  {
            return subStrArr[maxLongestIndex]
        }
        return ""
    }
}

let result = Solution().longestPalindrome("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth")
print("result:\(result)")


