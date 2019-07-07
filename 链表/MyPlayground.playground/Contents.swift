import UIKit

/*
 给出两个 非空的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class ListNode {
    var val:Int!
    var next:ListNode?
    init(_ val:Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    // s时间复杂度够了，空间复杂度过高
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carryFlg = 0 //表示进位
        var first:ListNode? = l1
        var second:ListNode? = l2
        var head:ListNode? = ListNode(-1) //创建一个新节点
        let p:ListNode? = head
        while first != nil || second != nil || carryFlg > 0 {
            let sum:Int = (first?.val ?? 0) + (second?.val ?? 0) + carryFlg
            
            head?.next = ListNode(sum%10)
            head = head?.next
            
            carryFlg = sum/10
            first = first?.next
            second = second?.next
        }
        return p?.next
    }
}

var l1:ListNode?
let l1_0 = ListNode(2)
let l1_1 = ListNode(4)
let l1_2 = ListNode(3)
l1_0.next = l1_1
l1_1.next = l1_2
l1 = l1_0

var l2:ListNode?
let l2_0 = ListNode(5)
let l2_1 = ListNode(6)
let l2_2 = ListNode(4)
l2_0.next = l2_1
l2_1.next = l2_2
l2 = l2_0

var l = Solution().addTwoNumbers(l1, l2)
while l != nil {
    print(l?.val ?? 0)
    l = l?.next
}




