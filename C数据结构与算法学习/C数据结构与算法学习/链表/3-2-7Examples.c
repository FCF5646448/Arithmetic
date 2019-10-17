//
//  3-2-7Examples.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/15.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "3-2-7Examples.h"
#include <stdlib.h>

// 这个难点是不能有新节点生成，只操作指针
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

// 查找两个链表的交汇节点
PtrToNode getIntersectionNode(List headA, ListheadB) {
    return NULL;
}

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
