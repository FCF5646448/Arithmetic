//
//  3-2-7Examples.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/15.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "3-2-7Examples.h"
#include <stdlib.h>

// 合并两个链表： 这个难点是不能有新节点生成，只操作指针
List mergeTwoLists(List l1, List l2) {
    // 创建一个空链表
    List Header;
    if (l1 == NULL) {
        return l2;
    }
    if (l2 == NULL) {
        return l1;
    }
    
    if (l1->element > l2->element) {
        Header = l2;
        l2 = l2->Next;
    }else{
        Header = l1;
        l1 = l1->Next;
    }
    
    Header->Next = NULL;
    PtrToNode P;
    P = Header;
    
    while ( NULL != l1->Next && NULL != l2->Next) {
        PtrToNode temp;
        if (l1->element >= l2->element ) {
            temp = l2;
            l2 = l2->Next;
            temp->Next = NULL;
        }else{
            temp = l1;
            l1 = l1->Next;
            temp->Next = NULL;
        }
        
        P->Next = temp;
        P = P->Next;
    }
    
    if (NULL != l1->Next) {
        P->Next = l1;
    }
    
    if (NULL != l2->Next) {
        P->Next = l2;
    }
    
    return Header;
}


// 查找两个链表的交汇节点 : 这道题就是通过消除长度差来实现的。当短链表A走到尽头，长链表B与尾部的距离就是长度差，然后短链表A指针重新指向长链表头部HeadB开始遍历，当B到达尾部时，那A距离尾部的位置肯定就是短链接的长度。所以B重新指向短链表，这样A和B就相当于在同一起跑线上了。如果有交集的话，两个指针相等就是交集，否则都为NULL时，退出循环。（整体思路就是长短链表都拼接一下凑成两个长度相等的链表进行遍历）。
PtrToNode getIntersectionNode(List headA, List headB) {
    List PA,PB;
    
    if (headA == NULL || headB == NULL) {
        return NULL;
    }
    
    PA = headA;
    
    PB = headB;

    // 如果没有交汇的结点，则就会都指向NULL
    while (PA != PB) {
        PA = (PA==NULL ? headB : PA->Next);
        
        PB = (PB==NULL ? headA : PB->Next);
    }
    
    return PA;
}

// 去除已排序列表的重复元素
List deleteDuplicates(List head){
    PtrToNode first,second;
    first = head;
    if (NULL == first) {
        return head;
    }
    second = first->Next;
    while (second != NULL) {
        //
        if (first->element == second->element) {
            //删除second指向的节点
            first->Next = second->Next;
            second->Next = NULL;
            second = first->Next;
        }else{
            first = first->Next;
            second = first->Next;
        }
        
    }
    return head;
}


// 查看链表是否有环： 用快慢指针的形式，
// 快慢指针的主要点就是1、起始位置，2、循环判断条件，3快指针是慢指针的2倍（起始只能做2倍处理）
int hasCycle(List head) {
    PtrToNode slower,fast;
    if (head == NULL || head->Next ==NULL) {
        return 0;
    }
    slower = head;
    fast = head->Next;
    while (fast != slower && NULL != fast && NULL != fast->Next) {
        fast = fast->Next->Next;
        slower = slower->Next;
    }
    
    if (fast == NULL || NULL == fast->Next) {
        return 0;
    }
    
    if (fast == slower) {
        return 1;
    }
    return 0;
}

// 判断一个链表是否是回文链表。1-2-2-1、1-2-1、1-1、1这些都是回文链表
// 解题思路，先通过快慢指针找到中间节点，然后
int isPalindrome(List head){
    
    return 0;
}



/********************************************************/
/********************************************************/
/********************************************************/
/********************************************************/


void testMergeTwoLists() {
    List l1 = Link_createL();
    List l2 = Link_createL();
    PtrToNode P1,P2,P;
    P1 = l1;
    P2 = l2;
    for (int i = 1; i<10; i+=2) {
        Link_insert(P1,i);
        P1 = P1->Next;
    }
    
    for (int i = 0; i<10; i+=2) {
        Link_insert(P2,i);
        P2 = P2->Next;
    }
    
    
    List result = mergeTwoLists(l1->Next,l2->Next);
    
    printf("结果：");
    P = result;
    while (NULL != P ) {
        printf("%d ",P->element);
        free(P);
        P = P->Next;
    }
    
}

PtrToNode makeNode(LinkElementType val) {
    PtrToNode n;
    n = malloc(sizeof(struct LinkNode));
    n->element = val;
    n->Next = NULL;
    return n;
}

void testGetIntersectionNode() {
    List l1 = Link_createL();
    List l2 = Link_createL();
    
    PtrToNode n0 =  makeNode(0);
    PtrToNode n1 =  makeNode(1);
    PtrToNode n2 = makeNode(2);
    PtrToNode n3 = makeNode(3);
    PtrToNode n4 = makeNode(4);
    PtrToNode n5 = makeNode(5);
    PtrToNode n6 =  makeNode(6);
    PtrToNode n7 = makeNode(7);
    PtrToNode n8 = makeNode(8);
    PtrToNode n9 = makeNode(9);
    PtrToNode n10 = makeNode(1);
    
    l1->Next = n0;
    n0->Next = n2;
//    n2->Next = n4;
//    n4->Next = n8;
//
    l2->Next = n2;
//    n1->Next = n3;
//    n3->Next = n8;
//
//    n8->Next = n7;
//    n7->Next = n9;
    
    
    
//    PtrToNode P1,P2;
//    P1 = l1;
//    P2 = l2;
//    for (int i = 1; i<10; i+=2) {
//        Link_insert(P1,i);
//        P1 = P1->Next;
//    }
//
//    for (int i = 0; i<10; i+=2) {
//        Link_insert(P2,i);
//        P2 = P2->Next;
//    }
    
    PtrToNode result = getIntersectionNode(l1->Next,l2->Next);
    if (result != NULL) {
         printf("结果：%d",result->element);
    }else{
         printf("结果：no find");
    }
   
    
}

void testdeleteDuplicates() {
    List l1 = Link_createL();
    PtrToNode n0 =  makeNode(0);
    PtrToNode n1 =  makeNode(1);
    PtrToNode n2 = makeNode(1);
    PtrToNode n3 = makeNode(2);
    PtrToNode n4 = makeNode(2);
    PtrToNode n5 = makeNode(3);
    PtrToNode n6 =  makeNode(3);
    PtrToNode n7 = makeNode(4);
    PtrToNode n8 = makeNode(4);
    PtrToNode n9 = makeNode(5);
    PtrToNode n10 = makeNode(5);
    
    l1->Next = n0;
    n0->Next = n1;
    n1->Next = n2;
    n2->Next = n3;
    n3->Next = n4;
    n4->Next = n5;
    n5->Next = n6;
    n6->Next = n7;
    n7->Next = n8;
    n8->Next = n9;
    n9->Next = n10;
    
    List result = deleteDuplicates(l1->Next);
    PtrToNode P;
    printf("结果：");
    P = result;
    while (NULL != P ) {
        printf("%d ",P->element);
        free(P);
        P = P->Next;
    }
    
}

void testhasCycle() {
    List l1 = Link_createL();
    PtrToNode n0 =  makeNode(0);
    PtrToNode n1 =  makeNode(1);
    PtrToNode n2 = makeNode(1);
    PtrToNode n3 = makeNode(2);
    PtrToNode n4 = makeNode(2);
    PtrToNode n5 = makeNode(3);
    
    l1->Next = n0;
    n0->Next = n1;
    n1->Next = n2;
    n2->Next = n3;
    n3->Next = n4;
    n4->Next = n5;
    n5->Next = n2;
    
    int result = hasCycle(l1->Next);
    printf("结果：%s",(result == 1 ? "有环":"无环"));
    
}
