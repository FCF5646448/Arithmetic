import UIKit

var greeting = "Hello, playground"

class ListNode: Equatable {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
    convenience init() {
        self.init(0, nil)
    }
    
    
    /// 找出倒数第K个节点，要背
    func findFromEnd(head: ListNode, k: Int) -> ListNode? {
        var fast: ListNode? = head
        var slow: ListNode? = head
        var i = 1
        while fast != nil {
            if i > k {
                fast = fast!.next
                slow = slow!.next
            } else {
                fast = fast!.next
            }
            i += 1
        }
        // 这里不能用等于
        if i > k {
            print(slow!.val)
            return slow
        } else {
            return nil
        }
    }
    
    static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
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
        // 下虑 建立小顶堆
        func shiftUp(array: inout [ListNode], index: Int) {
            let element = array[index]
            var index = index
            while index > 0 {
                let parentIndex = (index - 1) / 2
                let parent = array[parentIndex]
                
                if element.val >= parent.val {
                    break
                }
                array[index] = element
                index = parentIndex
            }
            array[index] = element
        }
        
        // 链表入堆
        var array = [ListNode]()
        for node in lists {
            var temp = node
            while temp != nil {
                let currentNode = temp
                temp = temp!.next
                currentNode!.next = nil
                
                array.append(currentNode!)
                shiftUp(array: &array, index: array.count - 1)
            }
        }
        
        // 重新创建链表
        let dummy = ListNode()
        var p: ListNode? = dummy
        for node in array {
            p?.next = node
            p = p?.next
        }
        
        return dummy.next
    }
    
    /// 23 合并k个升序链表 使用最小堆
    /// 使用优先级队列
    func mergeKLists2(_ lists: [ListNode?]) -> ListNode? {
        // 维护队列的优先级
        func enqueue(priority: inout [ListNode], _ element: ListNode) {
            for (index, otherElement) in priority.enumerated() {
                if element.val < otherElement.val {
                    priority.insert(element, at: index)
                    return
                }
            }
            priority.append(element)
        }
        
        // 重新创建链表
        let dummy = ListNode()
        var p: ListNode? = dummy
        
        var priorityArray: [ListNode] = []
        
        for node in lists {
            if let node = node {
                enqueue(priority: &priorityArray, node)
            }
        }
        
        while !priorityArray.isEmpty {
            let fitst = priorityArray.removeFirst()
            p?.next = fitst
            if let next = fitst.next {
                enqueue(priority: &priorityArray, next)
            }
            p = p?.next
        }
        
        return dummy.next
    }
    
    /// 19 删除链表的倒数第K个节点，先找到第k+1个节点，也就是前一个节点
    /// * 重点
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil else {
            return nil
        }
        let pre = findFromEnd(head: head!, k: n + 1)
        if pre != nil {
            pre!.next = pre!.next!.next
            return head
        } else {
            // 没找到就说明是第一个元素
            return head?.next
        }
    }
    
    /// 876 链表的中间节点（快慢指针）
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }
        
        // 小于2个节点的情况
        if head?.next == nil {
            return head
        }
        
        var fast = head
        var slow = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
    
    /// 查找链表中环的入口节点
    /// 注意，这里节点相等，使用===
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        var fast: ListNode? = head
        var slow: ListNode? = head
        while fast != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if let fast = fast,
               let slow = slow,
               fast === slow {
                // 相交
                break
            }
        }
        
        if fast == nil || fast?.next == nil {
            return nil
        }
        
        // 慢指针从头开始，与快指针同步移动
        slow = head
        while !(fast! === slow!) {
            fast = fast?.next
            slow = slow?.next
        }
        return slow
    }
    
    /// 判断链表是否有环：快慢指针
    func hasCycle(_ head: ListNode?) -> Bool {
        guard head != nil else { return false }
        var fast: ListNode? = head
        var slow: ListNode? = head
        while fast != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if let fast = fast,
               let slow = slow,
               fast.val == slow.val {
                // 相交
                return true
            }
        }
        return false
    }
    
    /// https://leetcode.cn/problems/intersection-of-two-linked-lists/submissions/
    /// 查找两个链表的相交节点
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard headA != nil && headB != nil else { return nil }
        var p1: ListNode? = headA
        var p2: ListNode? = headB
        
        while !(p1 === p2) {
            p1 = p1?.next
            p2 = p2?.next
            if p1 == nil && p2 != nil {
                p1 = headB
            } else if p2 == nil && p1 != nil {
                p2 = headA
            }
        }
        return p1
    }
}
