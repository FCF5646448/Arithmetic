import UIKit

var str = "Hello, playground"

class Solution {
    func reverseString(_ s: inout [Character]) {
        if s.count > 1 {
            var sb:[Character] = Array(s[1..<s.count])
            reverseString(&sb)
            s = sb + [s[0]]
            
            print(s)
        }
    }
}

var s:[Character] = Array("hello")
Solution().reverseString(&s)





