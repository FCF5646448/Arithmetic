import UIKit

var str = "Hello, playground"

class ListNode{
    var val:Int?
    var next:ListNode?
    init(_ val:Int) {
        self.val = val
    }
}

/*
 给出一个链表和一个值x，要求将链表中所有小于x的值都放到左边，所有大于或等于x的值都放到右边
 eg: 1——5——3——2——4——2 给定x=3 则：1——2——2——5——3——4
*/

func partition(_ head:ListNode?, _ x:Int)->ListNode?{
    let leftTemp = ListNode(0),rightTemp = ListNode(0) //引入一个中间层
    var leftpre = leftTemp, rightpre = rightTemp
    
    var node = head
    while node != nil {
        if let v = node!.val {
            if v < x{
                leftpre.next = node
                leftpre = node!
            }else{
                rightpre.next = node
                rightpre = node!
            }
        }
        node = node!.next
    }

    rightpre.next = nil //防止构成环
    leftpre.next = rightTemp.next
    return leftTemp.next
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

var result = partition(n0, 3)
while result != nil {
    print(result?.val!)
    result = result!.next
}


