import UIKit

var greeting = "广度优先搜索"

class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        // 字符向前
        func numPrev(_ char: Character) -> Character {
            let num = Int(String(char))!
            let ret = num == 0 ? 9: num - 1
            return Character(String(ret))
        }
        // 字符向后
        func numSucc(_ char: Character) -> Character {
            let num = Int(String(char))!
            let ret = num == 9 ? 0: num + 1
            return Character(String(ret))
        }
        // 枚举一次旋转就可以获取到的数字
        func enumOnceStr(_ str: String) -> [String] {
            var ret = [String]()
            var strArr = Array(str)
            for i in 0 ..< 4 {
                let char = strArr[i]
                strArr[i] = numPrev(char)
                ret.append(String(strArr))
                strArr[i] = numSucc(char)
                ret.append(String(strArr))
                strArr = Array(str)
            }
            return ret
        }
        
        guard target != "0000" else {
            return 0
        }

        guard !deadends.contains("0000") else {
            return -1
        }
        
        // 存储字符串及当前状态
        var queue: [(String, Int)] = []
        queue.append(("0000", 0))
        var seen = ["0000"]
        
        print(enumOnceStr(target))
        
        while !queue.isEmpty {
            let element = queue.removeFirst()
            for nextItem in enumOnceStr(element.0) {
                if !seen.contains(nextItem) && !deadends.contains(nextItem) {
                    if nextItem == target {
                        return element.1 + 1
                    }
                    queue.append((nextItem, element.1 + 1))
                    seen.insert(nextItem, at: 0)
                }
            }
        }
        
        return -1
    }
}

//print(Solution().openLock(["0201","0101","0102","1212","2002"], "0202"))


class DFS {
    /// 每日温度 要结合下标来计算，否则很难保留结果
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        guard temperatures.count > 0 else {
            return []
        }
        var stack = [(num: Int, index: Int)]()
        var temperaturesDic = [Int: Int]()
        for (index, temperature) in temperatures.enumerated() {
            if let top = stack.last, temperature > top.num {
                for item in stack.reversed() {
                    if temperature > item.num  {
                        // pop item
                        let item = stack.removeLast()
                        temperaturesDic[item.index] = index - item.index
                    }
                }
            }
            stack.append((num: temperature, index: index))
        }
        var result = [Int]()
        for index in 0..<temperatures.count {
            if let value = temperaturesDic[index] {
                result.append(value)
            } else {
                result.append(0)
            }
        }
        return result
    }
    
    /// 逆波兰表达式
    func evalRPN(_ tokens: [String]) -> Int {
        func eval(num0: Int, num1: Int, eval: String) -> Int {
            switch eval {
            case "+":
                return num0 + num1
            case "-":
                return num0 - num1
            case "*":
                return num0 * num1
            case "/":
                return num0 / num1
            default:
                fatalError("error eval")
            }
        }
        guard tokens.count > 0 else {
            return 0
        }
        let evals = ["+", "-", "*", "/"]
        var stack = [String]()
        for token in tokens {
            
            if evals.contains(token) && stack.count > 1 {
                // 是运算符, 判断栈顶最近两位数是否是数字
                let top0 = stack[stack.count - 1]
                let top1 = stack[stack.count - 2]
                if !evals.contains(top0) && !evals.contains(top1) {
                    stack.removeLast(2)
                    let result = eval(num0: Int(top1)!, num1: Int(top0)!, eval: token)
                    stack.append(String(result))
                    continue
                }
            }
            stack.append(token)
        }
        return Int(stack.first!)!
    }
}

debugPrint(DFS().evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]))
