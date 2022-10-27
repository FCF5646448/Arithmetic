import UIKit
import Foundation

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

// 判断是否是一个有效二叉树
func isValidST(_ root: TreeNode?, min: Int = Int.min, max: Int = Int.max) -> Bool {
    guard let root = root else {
        return true
    }
    
    if min >= root.value || max <= root.value {
        return false
    }
    
    return isValidST(root.left, min: min, max: root.value) && isValidST(root.right, min: root.value, max: max)
}

func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    
    if val < root.value {
        return searchBST(root.left, val)
    } else if val > root.value {
        return searchBST(root.right, val)
    } else if val == root.value {
        return root
    }
    return nil
}


/// 删除二叉树的节点
func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    
    if key < root.value {
        root.left = deleteNode(root.left, key)
        return deleteNode(root.left, key)
    } else if key > root.value {
        root.right = deleteNode(root.right, key)
    } else {
        // 删除节点。
        if let head = root.right {
            // 返回以右节点为根节点的新树
            var node = head
            while node.left != nil {
                node = node.left!
            }
            node.left = root.left
            return head
        } else {
            return root.left
        }
    }
    return root
}

func isBalanced(_ root: TreeNode?) -> Bool {
    func maxHeight(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        return max(maxHeight(root.left), maxHeight(root.right)) + 1
    }
    
    guard let root = root else {
        return true
    }
    
    let leftH = maxHeight(root.left)
    let rightH = maxHeight(root.right)
    if abs(leftH - rightH) > 1 {
        return false
    }
    
    return isBalanced(root.left) && isBalanced(root.right)
}

func countNodes0(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    
    return countNodes0(root.left) + countNodes0(root.right) + 1
}

func countNodes(_ root: TreeNode?) -> Int {
    // 计算层级
    func countLevel(_ root: TreeNode?) -> Int {
        var root = root
        var level = 0
        while root != nil {
            level += 1
            root = root?.left
        }
        return level
    }
       
    guard let root = root else {
        return 0
    }
    
    let lLevel = countLevel(root.left)
    let rLevel = countLevel(root.right)
    if lLevel == rLevel {
        // 层级相等，则右子树为完全二叉树，左子树为满二叉树，满二叉树的节点个数 = 2^h-1个节点 也就是 （1<<h - 1）
        return countNodes(root.right) + (1 << lLevel)
    } else {
        return countNodes(root.left) + (1 << rLevel)
    }
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
    
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        for i in 0..<numRows {
            var rows = [Int]()
            for j in 0...i {
                if j == 0 || i == j {
                    debugPrint("1:(\(i), \(j))")
                    rows.append(1)
                } else {
                    debugPrint("2:(\(i), \(j))")
                    let num = result[i-1][j-1] + result[i-1][j]
                    rows.append(num)
                }
            }
            result.append(rows)
        }
        return result
    }
    
    func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex == 0 else {
            return [1]
        }
        let oldNums = getRow(rowIndex - 1)
        print("row:\(rowIndex), \(oldNums)")
        var newRows = [Int]()
        for j in 0...rowIndex {
            if j == 0 || j == rowIndex {
                newRows.append(1)
            } else {
                let num = oldNums[j-1] + oldNums[j]
                newRows.append(num)
            }
        }
        return newRows
    }
}

TreeTest().test()

debugPrint(TreeTest().getRow(3))
