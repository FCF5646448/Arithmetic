import UIKit

var greeting = "广度、深度优先搜索"

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }

class BFS {
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
    
    /// 岛屿数量
    func numIslands(_ grid: [[Character]]) -> Int {
        func changedElement(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
            guard i >= 0, i < grid.count, j >= 0, j < grid[i].count, grid[i][j] == "1" else { return }
            grid[i][j] = "0"
            changedElement(&grid, i - 1, j)
            changedElement(&grid, i + 1, j)
            changedElement(&grid, i, j - 1)
            changedElement(&grid, i, j + 1)
        }
        
        guard grid.count > 0 && (grid.first?.count ?? 0) > 0 else {
            return 0
        }
        var grids = grid
        var numOfIsland = 0
        for i in 0..<grids.count {
            for j in 0..<grids[0].count {
                if grids[i][j] == "1" {
                    numOfIsland += 1
                    changedElement(&grids, i, j)
                }
            }
        }
        return numOfIsland
    }
    
    /// 更改颜色
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        func changeFlood(_ image: inout [[Int]], _ visited: inout [[Bool]], _ sr: Int, _ sc: Int, _ oldColor: Int, _ newColor: Int) {
            guard sr >= 0,
                  sr < image.count,
                  sc >= 0,
                  sc < image[0].count,
                  !visited[sr][sc],
                  image[sr][sc] == oldColor,
                  image[sr][sc] != newColor else {
                return
            }
            visited[sr][sc] = true
            image[sr][sc] = newColor
            changeFlood(&image, &visited, sr - 1, sc, oldColor, newColor)
            changeFlood(&image, &visited, sr + 1, sc, oldColor, newColor)
            changeFlood(&image, &visited, sr, sc - 1, oldColor, newColor)
            changeFlood(&image, &visited, sr, sc + 1, oldColor, newColor)
        }
        guard image.count > 0, image[0].count > 0,
              sr >= 0,
              sr < image.count,
              sc >= 0,
              sc < image[0].count else {
            return []
        }
        var newImage = image
        
        let oldColor = newImage[sr][sc]
        var visited = Array(repeating: Array(repeating: false, count: image[0].count), count: image.count)
        changeFlood(&newImage, &visited, sr, sc, oldColor, color)
        return newImage
    }
    
    /// 01 矩阵， 多源广度优先搜索
    /// 将所有0先放到一个队列里，然后查看其他每个元素到这个队列里所有元素的距离。
    /// 优先入队的所有0元素，可以看做是一个超级源（多源广度优先算法中，经常用到的技巧）
    /// 然后从这个超级源中的每一个元素向外扩散，走一层，距离+1。
    /// 算法题解：https://leetcode.cn/problems/01-matrix/solutions/202012/01ju-zhen-by-leetcode-solution/
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let row = mat.count // 行数
        let col = mat.first?.count ?? 0 // 列数
        guard row > 0, col > 0 else {
            return []
        }
        
        let direc: [(x: Int, y: Int)] = [(-1, 0), (1, 0), (0, -1), (0, 1)] // 4个方向
        var visited = Array(repeating: Array(repeating: false, count: mat[0].count), count: mat.count)
        var queue: [(x: Int, y: Int)] = []
        for i in 0 ..< mat.count {
            for j in 0 ..< mat[0].count {
                if mat[i][j] == 0 {
                    visited[i][j] = true
                    queue.append((x: i, y: j))
                }
            }
        }
        
        var result = Array(repeating: Array(repeating: 0, count: mat[0].count), count: mat.count)
        var cost = 1
        while !queue.isEmpty {
            let size = queue.count
            for _ in 0..<size {
                let element = queue.removeFirst()
                for dir in direc {
                    let ni = element.x + dir.x
                    let nj = element.y + dir.y
                    guard ni >= 0, ni < row, nj >= 0, nj < col, !visited[ni][nj] else {
                        continue
                    }
                    result[ni][nj] = cost
                    visited[ni][nj] = true
                    queue.append((x: ni, y: nj))
                }
            }
            cost += 1
        }
        
        return result
    }
    
    /// 钥匙和房间
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        guard rooms.count > 0 else {
            return true
        }
        var queue = [Int]()
        var visited = Array(repeating: false, count: rooms.count)
        queue.append(contentsOf: rooms[0])
        visited[0] = true
        var visitedNum = 1
        while !queue.isEmpty {
            let room = queue.removeFirst()
            if room >= 0, room < rooms.count, !visited[room] {
                let newRooms = rooms[room]
                queue.append(contentsOf: newRooms)
                visited[room] = true
                visitedNum += 1
            }
        }
        return visitedNum == rooms.count
    }
}

//print(BFS().openLock(["0201","0101","0102","1212","2002"], "0202"))
//let grid = [[Character]]([["1","1","1","1","0"],
//            ["1","1","0","1","0"],
//            ["1","1","0","0","0"],
//            ["0","0","0","0","0"]])
//debugPrint(BFS().numIslands(grid))
//debugPrint(BFS().floodFill([[0,0,0],[0,0,0]], 0, 0, 0))
debugPrint(BFS().updateMatrix([[0,0,0],[0,1,0],[1,1,1]]))


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
    
    /// 字符串解码
    func decodeString(_ s: String) -> String {
        /// 将chars循环num次
        func decodeChar(chars: [Character], num: Int) -> [Character] {
            var newChars = [Character]()
            var tempNum = num
            while tempNum > 0 {
                newChars.append(contentsOf: chars)
                tempNum -= 1
            }
            return newChars
        }
        /// 获取从']'到'['之间的字符
        func changeRangeChars(_ stack: inout [Character]) {
            /// 获取'['前面的数字
            func getNum(_ stack: inout [Character]) -> Int? {
                var sum = 0
                var ten = 1
                while !stack.isEmpty {
                    let numChar = stack.removeLast()
                    if let num = Int(String(numChar)) {
                        sum += num * ten
                        ten *= 10
                    } else {
                        stack.append(numChar)
                        break
                    }
                }
                return sum
            }
            var chars = [Character]()
            // 获取从']'到'['之间的字符
            while !stack.isEmpty {
                let topEle = stack.removeLast()
                if topEle == "[" {
                    break
                }
                chars.insert(topEle, at: 0)
            }
            guard chars.count > 0, let num = getNum(&stack) else { return }
            let newChars = decodeChar(chars: chars, num: num)
            stack.append(contentsOf: newChars)
        }
        
        guard s.count > 0 else { return "" }
        var sArr = Array(s)
        var stack = [Character]()
        while !sArr.isEmpty {
            let first = sArr.removeFirst()
            if first == "]" {
                changeRangeChars(&stack)
            } else {
                stack.append(first)
            }
        }
        return String(stack)
    }
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var result = [Int]()
        var stack: [TreeNode] = []
        var node: TreeNode? = root
        while !stack.isEmpty || node != nil {
            if node != nil {
                stack.append(node!)
                node = node!.left
            } else {
                let topEle = stack.removeLast()
                result.append(topEle.val)
                node = topEle.right
            }
        }
        return result
    }
}

//debugPrint(DFS().evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]))

//debugPrint(DFS().decodeString("3[a2[c]]"))


