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
        // 建立小顶堆
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
    
    // 23 合并k个升序链表 使用最小堆
    func mergeKLists2(_ lists: [ListNode?]) -> ListNode? {
        // 建立小顶堆
        func shiftDown(array: inout [ListNode], index: Int) {
            let element = array[index]
            let size = array.count
            let half = size / 2
            var index = index
            while index < half {
                var childIndex = index * 2 + 1
                var child = array[childIndex]
                let rightIndx = childIndex + 1
                if rightIndx < size && array[rightIndx].val < child.val {
                    childIndex = rightIndx
                    child = array[rightIndx]
                }
                
                if element.val < child.val {
                    break
                }
                
                array[index] = child
                index = childIndex
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
            }
        }
        
        // 下虑调整
        var index = array.count / 2 - 1
        while index >= 0 {
            shiftDown(array: &array, index: index)
            index -= 1
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
    
    // 批量建小顶堆
    func buildHeap(array: [Int]) {
        func shiftDown(array: inout [Int], index: Int, size: Int) {
            let element = array[index]
            var index = index
            while index < size / 2 {
                var childIndex = index * 2 + 1
                var child = array[childIndex]
                let rightIndx = childIndex + 1
                if rightIndx < size && array[rightIndx] < child {
                    childIndex = rightIndx
                    child = array[rightIndx]
                }
                
                guard element > child else {
                    break
                }
                
                array[index] = child
                index = childIndex
            }
            array[index] = element
        }
        
        guard array.count > 0 else { return }
        var array = array
        var index = array.count / 2 - 1
        while index >= 0 {
            shiftDown(array: &array, index: index, size: array.count)
            index -= 1
        }
        print(array)
    }
}

let node = ListNode()
node.buildHeap(array: [1,4,5,1,3,4,2,6])
