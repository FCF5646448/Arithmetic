import UIKit


/*
 动态规划问题;
 1、假设字符串从小标i-j是回文子串，那么下标i+1从j-1就肯定是回文子串；
 2、所以双重循环，i降序，j升序。
 */
class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.count <= 1 {
            //长度小于1肯定是
            return s
        }
        var sChars = Array(s)
        let n = s.count
        var left = 0
        var right = 0
        var boolArr = Array(repeating: Array(repeating: false, count: n), count: n)
        
        for i in (0...n-2).reversed() {
            boolArr[i][i] = true
            
            for j in (i+1..<n) {
                boolArr[i][j] = (sChars[i] == sChars[j] && (j-i < 3 || boolArr[i+1][j-1]))
                if boolArr[i][j] && (right - left < j - i) {
                    left = i
                    right = j
                }
            }
        }
        
        let startIndex = s.index(s.startIndex, offsetBy: left)
        let endIndex =  s.index(s.startIndex, offsetBy: right+1)
        
        return String(s[startIndex..<endIndex])
    }
}

let result = Solution().longestPalindrome("dsfsdhadhfkdsdsfsdhadhdsfsdhadhfkddsfsdhadhfkdsahfksadhdsfsdhadhfkdsahfksadhfksddsfsdhadhfkdsahfksadhfksdhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhskdsfsdhadhfkdsahfksadhfksdhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhskhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhskdsfsdhadhfkdsahfksadhfksdhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhskdsfsdhadhfkdsahfksadhfksdhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhskdsfsdhadhfkdsahfksadhfksdhfusdihfksjadsfsdhadhfkdsahfksadhfksdhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhskdsfsdhadhfkdsahfksadhfksdhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhskdfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhskfdsfsdhadhfkdsahfksadhfksdhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhskksdhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhsksahfksadhfksdhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhskfkdsahfksadhfksdhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhskahfksadhfksdhfusdihfksjadfhksadjkdsahfdsjkhfksdhffhiawoeuruihweiyrtiuoncsdbfzmbfkhfioaewncfhsk")
print(result)





