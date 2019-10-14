import UIKit

// 二叉树节点
class TreeNode {
    var left : TreeNode?
    var right : TreeNode?
    var val : Int
    
    init(_ val : Int) {
        self.val = val
    }
}

/*
 1、二叉查找树： 左子树的节点都小于根节点，右子树的节点都大于根节点
 */

// q: 如何判断一棵树是二叉查找树
func isValibBST(_ root:TreeNode?, _ min:Int?, _ max:Int?) -> Bool {
    guard let node = root else {
        return true
    }
    
    // min 有值，那肯定是右子树，所有右子树的值都大于根节点，有小于就不是二叉查找树
    if let min = min, node.val <= min {
        return false
    }
    
    // max有值，肯定是左子树，所有左子树的值都小于根节点，有大于就不是二叉查找树
    if let max = max, node.val >= max {
        return false
    }
    
    return isValibBST(node.left, min, node.val) && isValibBST(node.right, node.val, max)
}


/*
 二叉树的3种遍历
 递归实现
 */
//前序 根-左-右
func pre(_ root:TreeNode?) {
    if root != nil {
        print(root!.val)
        pre(root?.left)
        pre(root?.right)
    }
}
//中序 左-根-右
func mid(_ root:TreeNode?) {
    if let node = root {
        mid(node.left)
        print(node.val)
        mid(node.right)
    }
}
//后序： 左-右-根
func post(_ root:TreeNode?) {
    if let node = root {
        post(node.left)
        post(node.right)
        print(node.val)
    }
}

/*
 二叉树的3种遍历
 非递归实现 都需要借助栈实现
 */
func pre2(_ root:TreeNode?) -> [Int] {
    var res = [Int]()
    var stack = [TreeNode]()
    var node = root
    
    while !stack.isEmpty || node != nil {
        if node != nil {
            res.append(node!.val)
            stack.append(node!)
            node = node!.left
        }else{
            node = stack.removeLast().right
        }
    }
    
    return res
}

func mid2(_ root:TreeNode?)->[Int] {
    var res = [Int]()
    var stack = [TreeNode]()
    var node = root
    
    while !stack.isEmpty || node != nil {
        if node != nil {
            stack.append(node!)
            node = node!.left //
        }else{
            node = stack.removeLast()
            res.append(node!.val)
            node = node!.right
        }
    }
    return res
}

/**/
func post2(_ root:TreeNode?) -> [Int] {
    var res = [Int]()
    var stack = [TreeNode]()
    var node = root
    var tagStack = [Bool]()
    while !stack.isEmpty || node != nil {
        while node != nil {
            stack.append(node!)
            tagStack.append(false)
            node = node?.left
        }
        
        while !stack.isEmpty && tagStack.last! {
            tagStack.removeLast()
            res.append(stack.removeLast().val)
        }

        if !stack.isEmpty {
            tagStack.removeLast()
            tagStack.append(true)
            node = stack.last!.right
        }
    }
    return res
}


var root = TreeNode(1)
var node1 = TreeNode(2)
var node2 = TreeNode(3)
var node3 = TreeNode(4)
var node4 = TreeNode(5)
var node5 = TreeNode(6)
var node6 = TreeNode(7)
var node7 = TreeNode(8)
var node8 = TreeNode(9)

root.left = node1
root.right = node2
node1.left = node3
node1.right = node4
node2.left = node5
node2.right = node6
node3.right = node7
node5.right = node8

let result0 = isValibBST(root, nil, nil)
print(result0)
print("********************\n")
pre(root)
print("********************\n")
mid(root)
print("********************\n")
post(root)
print("************pre2********\n")
print(pre2(root))
print("***********mid2*********\n")
print(mid2(root))
print("***********post2*********\n")
print(post2(root))
