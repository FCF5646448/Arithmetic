import UIKit

class ListNode{
    var val:Int?
    var next:ListNode?
    init(_ val:Int) {
        self.val = val
    }
}

/*
 1、如何检测一个链表是否有环？
 */

//注意，如果有环，那么快慢指针肯定会有重合的时候。如果没有环，那等快指针到头了就结束了
func hasCycle(_ head:ListNode?)->Bool{
    var slow = head
    var fast = head
    while fast != nil && fast!.next != nil {
        slow = slow!.next
        fast = fast!.next!.next
        if slow === fast {
            return true
        }
    }
    return false
}

var n0 = ListNode(1)
var n1 = ListNode(5)
var n2 = ListNode(3)
var n3 = ListNode(2)
var n4 = ListNode(4)
var n5 = ListNode(2)
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
n4.next = n5
n5.next = n0

let result = hasCycle(n0)
print(result)


/*
 2、删除链表中倒数第n个节点！
 eg：1——2——3——4——5 ,n=2 , 1——2——3——5
 */

//注： 这道题最容易犯的错误就是有数组思维。要知道链表是没有大小的，也没有下标。所以实际上你不遍历到结尾，你是不知道当前节点是属于第几个节点的。所以用两个速度相同的指针，但是快指针的起始位置比b慢指针大了n个节点。那么当快指针遍历到结尾时，则慢指针就只好是要删除的节点。
func removeNthFromEnd(_ head:ListNode?,_ n:Int) -> ListNode? {
    guard let head = head else {
        return nil
    }
    
    var dump = ListNode(0)
    dump.next = head
    var slow:ListNode? = dump
    var fast:ListNode? = dump
    
    //
    for _ in 0..<n {
        if fast == nil {
            break
        }
        fast = fast!.next
    }
    
    while fast != nil && fast!.next != nil {
        fast = fast!.next
        slow = slow!.next
    }
    
    slow!.next = slow!.next?.next
    return dump.next
}


var m0 = ListNode(1)
var m1 = ListNode(2)
var m2 = ListNode(3)
var m3 = ListNode(4)
var m4 = ListNode(5)
var m5 = ListNode(6)
m0.next = m1
m1.next = m2
m2.next = m3
m3.next = m4
m4.next = m5
m5.next = nil

var result2 = removeNthFromEnd(m0, 2)

while result2 != nil {
    print(result2!.val ?? "NO")
    result2 = result2!.next
}
