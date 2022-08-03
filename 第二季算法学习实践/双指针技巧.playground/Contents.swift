import UIKit

var greeting = "Hello, playground"

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
    convenience init() {
        self.init(0, nil)
    }
}

extension ListNode {
    // 合并两个链表
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode()
        var p: ListNode? = dummy
        var p1 = list1
        var p2 = list2
        
        while p1 != nil && p2 != nil {
            if p1!.val <= p2!.val {
                p = p1!.next
                p1 = p1!.next
            } else {
                p = p2!.next
                p2 = p2!.next
            }
            p = p!.next
        }
        
        if p1 != nil {
            p?.next = p1
        }
        
        if p2 != nil {
            p?.next = p2
        }
        return dummy.next
    }
    
    /// 86分割两个链表
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var p: ListNode? = head
        let minDummy = ListNode()
        let maxDummy = ListNode()
        var minL: ListNode? = minDummy
        var maxL: ListNode? = maxDummy
        
        while p != nil {
            if p!.val < x {
                minL?.next = p
                p = p!.next
                minL = minL?.next
                minL?.next = nil
            } else {
                maxL?.next = p
                p = p!.next
                maxL = maxL?.next
                maxL?.next = nil
            }
        }
        minL?.next = maxDummy.next
        return minDummy.next
    }
    
    // 23 合并k个升序链表 使用最小堆
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let dummy = ListNode()
        var p: ListNode? = dummy
        
        
        
        return dummy.next
    }
}
