//
//  ViewController.swift
//  Swift数据结构与算法学习
//
//  Created by 冯才凡 on 2019/12/3.
//  Copyright © 2019 冯才凡. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Solution().testQuickSort()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        testhuiwen()
    }
    
    
    func testhuiwen() {
        let h = ListNode(1)
        let f = ListNode(4)
        let s = ListNode(-1)
        let t = ListNode(-1)
        let t1 = ListNode(4)
        let s1 = ListNode(1)
        let f1 = ListNode(2)
        let h1 = ListNode(1)
        
        h.next = f
        f.next = s
        s.next = t
        t.next = t1
        t1.next = s1
//        s.next = f1
//        f1.next = h1
        
        if Solution().isPalindrome(h) == true {
            print("是回文链表")
        }else{
            print("不是回文链表")
        }
        
    }


}

