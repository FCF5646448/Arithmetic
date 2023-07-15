import UIKit

var greeting = "队列与栈"

// 节点
class Node {
    var value: Int = 0
    var childs: [Node] = []
    
    init(_ value: Int) {
        self.value = value
    }
}

class BFS {
    /// 广度搜索模版, 返回查找所需步骤
    func bfs(_ root: Node?, target: Node) -> Int {
        guard let root = root else {
            return -1
        }
        
        var queue = [Node]() // 队列
        var step = 0 // 查找所用的步骤
        queue.append(root)
        var level = [[Int]]()
        
        while !queue.isEmpty {
            step += 1
            let size = queue.count
            var currLevel = [Int]()
            for _ in 0..<size {
                let curr = queue.removeFirst()
                currLevel.append(curr.value)
                if curr.value == target.value {
                    return step
                }
                if !curr.childs.isEmpty {
                    queue.append(contentsOf: curr.childs)
                }
            }
            level.append(currLevel)
        }
        print(level)
        return -1
    }
    
    /// 279. 完全平方数，BFS算法
    func numSquares(_ n: Int) -> Int {
        var queue: [(n: Int, step: Int)] = []
        var visited = Array(repeating: false, count: n+1)
        queue.append((n: n, step: 0))
        while !queue.isEmpty {
            let size = queue.count
            for _ in 0..<size {
                let cur = queue.removeFirst()
                if cur.n == 0 {
                    return cur.step
                }
                var j = 1
                while j <= n {
                    let a = cur.n - j * j
                    if a < 0 {
                        break
                    }
                    if a == 0 {
                        return cur.step + 1
                    }
                    if !visited[a] {
                        queue.append((n: a, step: cur.step + 1))
                        visited[a] = true
                    }
                    j += 1
                }
            }
        }
        return -1
    }
}

class BFSTest {
    func test() {
        let node0 = Node(0)
        let node1 = Node(1)
        let node2 = Node(2)
        let node3 = Node(3)
        let node4 = Node(4)
        let node5 = Node(5)
        let node6 = Node(6)
        let node7 = Node(7)
        let node8 = Node(8)
        let node9 = Node(9)
        let node10 = Node(10)
        let node11 = Node(11)
        
        node0.childs = [node1, node2]
        node1.childs = [node3, node4]
        node2.childs = [node5, node6]
        node3.childs = [node7, node8]
        node4.childs = [node9, node10]
        node7.childs = [node11]
        
        BFS().bfs(node0, target: node11)
    }
    
    func test2(_ num: Int) -> Int {
        let pageNum = 2 * 4
        if num % pageNum > 0 {
            return num / pageNum + 1
        } else {
            return num / pageNum
        }
    }
}

//let test = BFSTest()
//for i in 0 ..< 20 {
//    debugPrint(test.test2(i))
//}

debugPrint(BFS().numSquares(13))
