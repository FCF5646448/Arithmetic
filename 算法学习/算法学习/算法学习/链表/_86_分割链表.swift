//
//  _86_分割练宝宝.swift
//  算法学习
//
//  Created by 冯才凡 on 2021/1/14.
//  Copyright © 2021 冯才凡. All rights reserved.
//

import Foundation

extension LinkList {
    /*
     给你一个链表和一个特定值 x ，请你对链表进行分隔，使得所有小于 x 的节点都出现在大于或等于 x 的节点之前。

     你应当保留两个分区中每个节点的初始相对位置。



     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/partition-list
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        guard head != nil else{
            return nil
        }

        let minDumy = ListNode(0)
        var minH = minDumy
        let maxDumy = ListNode(0)
        var maxH = maxDumy

        var p = head
        while p != nil {
            if p!.val >= x {
                maxH.next = p
                p = p!.next
                maxH = maxH.next!
                maxH.next = nil
            }else{
                minH.next = p
                p = p!.next
                minH = minH.next!
                minH.next = nil
            }
        }
        minH.next = maxDumy.next
        return minDumy.next
    }
}
