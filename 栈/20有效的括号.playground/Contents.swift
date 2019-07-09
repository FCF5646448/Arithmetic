import UIKit

/*
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
 
 有效字符串需满足：
 
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func isValid(_ s: String) -> Bool {
        var stack:[Character] = []
        if s == "" {return true}
        for c in s {
            if let pre = stack.last {
                if c == ")" && pre == "(" {
                    //出栈
                    stack.removeLast(1)
                    continue
                }else if c == "}" && pre == "{" {
                    //出栈
                    stack.removeLast(1)
                    continue
                }else if c == "]" && pre == "[" {
                    stack.removeLast(1)
                    continue
                }
            }
            stack.append(c)
        }
        
        if stack.count == 0 {
            return true
        }else{
            print(stack)
            return false
        }
    }
}

let result = Solution().isValid("(]")




