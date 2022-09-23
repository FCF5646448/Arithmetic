import UIKit

var greeting = "Hello, playground"

class TreeNode {
    var value: Int
    var right: TreeNode?
    var left: TreeNode?
    
    init(_ value: Int) {
        self.value = value
    }
    
    func print() {
        debugPrint(value)
    }
}

/// 遍历框架
func traverse(_ root: TreeNode?) {
    guard root != nil else { return }
    // 前序
    traverse(root!.left)
    // 中序
    traverse(root!.right)
    // 后序
}

// 最大深度
func maxDepth(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    return max(maxDepth(root!.left), maxDepth(root!.right)) + 1
}

/// 前序
func preOderTraverse(_ root: TreeNode?) -> [TreeNode] {
    func preOder(_ root: TreeNode?, res: inout [TreeNode]) {
        guard root != nil else { return}
        res.append(root!) // 中
        preOder(root?.left, res: &res) // 左
        preOder(root?.right, res: &res) // 右
    }
    var res = [TreeNode]()
    preOder(root, res: &res)
    return res
}

/// DFS
func dfsTraverse(_ root: TreeNode?) -> [TreeNode] {
    guard root != nil else { return [] }
    var res = [TreeNode]()
    var stack = [TreeNode]() // 栈
    stack.insert(root!, at: 0)
    while !stack.isEmpty {
        let node = stack.removeFirst()
        res.append(node)
        if node.right != nil {
            stack.insert(node.right!, at: 0)
        }
        if node.left != nil {
            stack.insert(node.left!, at: 0)
        }
    }
    return res
}

// 层次遍历
func levelOrder(_ root: TreeNode?) -> [TreeNode] {
    guard root != nil else { return [] }
    var res = [[TreeNode]]()
    var queue = [TreeNode]()
    queue.insert(root!, at: 0)
    
    while !queue.isEmpty {
        var levels = [TreeNode]()
        let size = queue.count
        for _ in 0..<size {
            let node = queue.removeLast()
            levels.append(node)
            if let left = node.left {
                queue.insert(left, at: 0)
            }
            if let right = node.right {
                queue.insert(right, at: 0)
            }
        }
        res.append(levels)
    }
    return res.flatMap({ $0 })
}


class TreeTest {
    func test() {
        let a = TreeNode(1)
        let b = TreeNode(2)
        let c = TreeNode(3)
        let d = TreeNode(4)
        let e = TreeNode(5)
        let f = TreeNode(6)
        let g = TreeNode(7)
        let h = TreeNode(8)
        
        a.left = b
        a.right = c
        b.left = d
        b.right = e
        c.left = f
        c.right = g
        e.right = h
        
        print("------------preOder-----------")
        let preOder = preOderTraverse(a)
        preOder.forEach { $0.print() }
        print("------------dfs-----------")
        let dfs = dfsTraverse(a)
        dfs.forEach { $0.print() }
        print("------------bfs-----------")
        let bfs = levelOrder(a)
        bfs.forEach { $0.print() }
        print("------------end-----------")
    }
}

TreeTest().test()
